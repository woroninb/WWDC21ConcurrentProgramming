import UIKit

extension UIImage {
    var thumbnialImage: UIImage? {
        get async {
            let size = CGSize(width: 20, height: 20)
            return await self.byPreparingThumbnail(ofSize: size)
        }
    }
}
