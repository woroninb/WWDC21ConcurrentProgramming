import SwiftUI

// model

struct SpacePhoto {
    var id: UUID
    var title: String
    var description: String
    var date: Date
    var url: URL
    
    static func requestFor(date: Date) -> URL {
        return URL(string: "")!
    }
    
    func save() async {
        
    }
}

extension SpacePhoto: Codable {}
extension SpacePhoto: Identifiable {}


// user interface

// UI will update whenever my data will update
@MainActor
class Photos: ObservableObject {
    @Published var items: [SpacePhoto] = []
    
    func updateItems() async {
        let fetchedItems = await fetchPhotos()
        self.items = fetchedItems
    }
    
    func fetchPhotos() async -> [SpacePhoto] {
        var downloaded: [SpacePhoto] = []
        for date in randonDates() {
            let url = SpacePhoto.requestFor(date: date)
            let photo = await fetchPhoto(url: url)
            
            if let photo = photo {
                downloaded.append(photo)
            }
        }
        return downloaded
    }
    
    private func fetchPhoto(url: URL) async -> SpacePhoto? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            return try decoder.decode(SpacePhoto.self, from: data)
        } catch {
            return nil
        }
    }
    
    private func randonDates() -> [Date] {
        return [Date()]
    }
}

struct PhotoView: View {
    var photo: SpacePhoto
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: photo.url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            HStack {
                Text(photo.title)
                Spacer()
                SavePhotoButton(photo: photo)
            }
            .padding()
            .background(.thinMaterial)
        }
        .background(.thickMaterial)
        .mask(RoundedRectangle(cornerRadius: 16))
        .padding(.bottom, 8)
    }
}

struct SavePhotoButton: View {
    var photo: SpacePhoto
    @State private var isSaving = false
    
    var body: some View {
        Button {
            Task {
                isSaving = true
                await photo.save()
                isSaving = false
            }
        } label: {
            Text("Save")
                .opacity(isSaving ? 0 : 1)
                .overlay {
                    if isSaving {
                        ProgressView()
                    }
                }
        }
        .disabled(isSaving)
        .buttonStyle(.bordered)
    }
}

struct CatalogView: View {
    
    @StateObject private var photos = Photos()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(photos.items) { item in
                  PhotoView(photo: item)
                        .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("Test")
            .listStyle(.plain)
            .refreshable {
                await photos.updateItems()
            }
        }
        .task {
            await photos.updateItems()
        }
    }
}
