import UIKit

struct Post {
    let id: Int
}

func getPersistedPosts(completion: ([Post], Error?) -> Void) {
}

func persistedPostst() async throws -> [Post] {
    typealias PostContinuation = CheckedContinuation<[Post], Error>
    return try await withCheckedThrowingContinuation { (continuation: PostContinuation) in
        getPersistedPosts { posts, error in
            if let error = error {
                continuation.resume(throwing: error)
            } else {
                continuation.resume(returning: posts)
            }
        }
    }
}
