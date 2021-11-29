import UIKit
import Foundation

enum NetworkError: Error {
    case ThumbFailError
}

func fetchThumbnailsUntructured(ids: [String], completion handler: ([String: UIImage]?, Error?) -> Void) {
    guard let id = ids.first else { return handler([:], nil) }
    let request = thubNailURLRequest(for: id)
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let response = resposne,let data = data else {
            return handler(nil, error)
        }
        // ... check  response ...
        UIImage(data: data)?.prepareThumbnail(of: CGSize(width: 20, height: 20), completionHandler: { image in
            
            guard let image = image else {
                return handler([:], NetworkError.ThumbFailError)
            }
            fetchThumbnailsUntructured(ids: ids.dropFirst()) { thumbnails, error in
                // ... add image to thmubnails
            }
            
        })
    }
}

func thubNailURLRequest(for id: String) -> URLRequest {
    return URLRequest(url: URL(string: id))
}
