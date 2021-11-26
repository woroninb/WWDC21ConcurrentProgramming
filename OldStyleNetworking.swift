import UIKit
import Foundation

enum NetworkError: Error {
    case badStatusCode
}

func fetchThumbnail(completion: @escaping (UIImage?, Error?)-> ()) {
    let request = URLRequest(url: URL(string: "https://previews.123rf.com/images/martialred/martialred1507/martialred150700740/42614010-internet-url-link-line-art-icon-for-apps-and-websites.jpg")!)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let error = error {
            completion(nil, error)
        } else if (response as? HTTPURLResponse)?.statusCode != 200 {
            completion(nil, NetworkError.badStatusCode)
        } else {
            guard let data = data else {
                return
            }
            
            let image = UIImage(data: data)
            guard let thumbnail = image?.preparingThumbnail(of: CGSize(width: 20, height: 20)) else {
                return
            }
            completion(thumbnail, nil)
        }
    }
    task.resume()
}


fetchThumbnail { image, error in
    let thumbnail = image
}
