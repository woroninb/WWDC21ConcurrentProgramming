import SwiftUI

struct TextView: View {
    var body: some View {
        Text("Text")
            .onAppear {
                Task {
                    try await asyncCall()
                }
            }
        
    }
}

enum NetworkError: Error {
    case wrongStatusCode
    case noImageData
}

func asyncCall() async throws -> UIImage {
    let request = URLRequest(url: URL(string: "")!)
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        throw NetworkError.noImageData
    }
    
    let tempImage = UIImage(data: data)
    
    guard let thumbnail = await tempImage?.byPreparingThumbnail(ofSize: CGSize(width: 20, height: 20)) else {
        throw NetworkError.noImageData
    }
    return thumbnail
}


TextView()
