import UIKit

@MainActor
class MyDelegate: UICollectionViewDelegate {
    func collectionView(_ view: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt item: IndexPath) {
        
        let ids = getThumbnailIDs(for: item)
        
        Task {
            let thumbnails = await fetchThumbnails(for: ids)
            display(thumbnails, in: cell)
        }
    }
}
