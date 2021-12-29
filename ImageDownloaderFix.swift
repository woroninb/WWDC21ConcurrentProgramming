import SwiftUI

actor ImageDownloader {
    private var cache: [URL: Image] = [:]
    
    func image(url: URL) async throws -> Image? {
        
        if let image = cache[url] {
            return image
        }
        
        let image = try await downloadImage(url: url)
        cache[url] = cache[url, default: image]
        return cache[url]
    }
}
