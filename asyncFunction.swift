import UIKit

// Meet async/await in swift
// https://developer.apple.com/videos/play/wwdc2021/10132/
// Title: Example of Async function

enum FetchError: Error {
    case wrongStatusCode
}

func fetchThumbnail(for id: String) async throws -> UIImage {
    
    let request = URLRequest(url: URL(string: "https://previews.123rf.com/images/martialred/martialred1507/martialred150700740/42614010-internet-url-link-line-art-icon-for-apps-and-websites.jpg")!)
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        throw FetchError.wrongStatusCode
    }
    
    let image = UIImage(data: data)
    
    guard let thumbnail = await image?.thumbNail else {
        throw FetchError.wrongStatusCode
    }
    
    return thumbnail
}


extension UIImage {
    var thumbNail: UIImage? {
        get async {
            guard let thumbnail = await self.byPreparingThumbnail(ofSize: CGSize(width: 20, height:  20)) else {
                return nil
            }
            return thumbnail
        }
    }
}

Task {
    let image = try await fetchThumbnail(for: "test")
}

