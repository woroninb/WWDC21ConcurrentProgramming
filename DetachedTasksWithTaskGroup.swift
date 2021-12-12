import UIKit

@MainActor
class MyDelegate: UICollectionViewDelegate {
    func collectionView(_ view: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt item: IndexPath) {
        
        var thumbnailsTasks: [IndexPath: Task<Void, Never>] = [:]
        let ids = getThumbnailIDs(for: item)
        
        thumbnailsTasks[item] = Task {
            defer { thumbnailsTasks[item] = nil  }
            let thumbnails = await fetchThumbnails(for: ids)
            
            Task.detached(priority: .background) {
                withTaskGroup(of: Void.self) { g in
                    g.async {
                        writeToLocalCache(thumbnails)
                    }
                    g.async {
                        log()
                    }
                    g.async {
                        ...
                    }
                }
            }
            display(thumbnails, in: cell)
        }
    }
}
