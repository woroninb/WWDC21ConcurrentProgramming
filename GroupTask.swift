import UIKit

func fetchThumbNails(for ids: [String]) async throws -> [String: UIImage] {
    var thumbNails: [String: UIImage] = [:]
    try await withThrowingTaskGroup(of: Void.self) { group in
        for id in ids {
            group.addTask {
                thumbNails[id] = try await fetchThumbnail(id: id)
            }
        }
    }
    return thumbNails
}

func fetchThumbnail(id: String) async throws -> UIImage {
    
}
