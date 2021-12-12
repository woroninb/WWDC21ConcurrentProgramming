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
                writeToLocalCache(thumbnails)
            }
            
            display(thumbnails, in: cell)
        }
    }
}
