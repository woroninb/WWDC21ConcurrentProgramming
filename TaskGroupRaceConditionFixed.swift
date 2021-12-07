import UIKit
import Darwin

func fetchThumbnails(ids: [String]) async throws -> [String: UIImage] {
    
    var thumbnails: [String: UIImage] = [:]
    try await withThrowingTaskGroup(of: (String, UIImage).self) { group in
        for id in ids {
            group.addTask {
                return (id, try await fetchThumbnail(id: id))
            }
        }
        
        for try await (id, thumbnail) in group {
            thumbnails[id] = thumbnail
        }
        
    }
    
    return thumbnails
}

func fetchThumbnail(id: String) async throws -> UIImage {
    return UIImage()
}
