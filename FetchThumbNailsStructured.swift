import UIKit

enum NetworkError: Error {
    case networkError
    case wrongStatusCode
    case noImage
}

func fetchThumbNailsStructured(for ids: [String]) async throws -> [String: UIImage] {
    var imageDict: [String: UIImage] = [:]
    for id in ids {
        let request = URLRequest(url: URL(string: "")!)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.wrongStatusCode
        }
        
        guard let thumbNail = await UIImage(data: data)?.byPreparingThumbnail(ofSize: CGSize(width: 20, height: 20)) else {
            throw NetworkError.noImage
        }
        
        imageDict[id] = thumbNail
    }
    return imageDict
}
