import UIKit


func fetchThumbNails(ids: [String]) async throws {
    var thumbNails: [String: UIImage] = [:]
    
    for id in ids {
        try Task.checkCancellation()
        thumbNails[id] = try await fetchThumbNail(id: id)
    }
    return thumbNails
}
