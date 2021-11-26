import UIKit

struct Post {
    let id: Int
}

func persistedPoststNot() async -> [Post] {
    typealias PostContinuation = CheckedContinuation<[Post], Never>
    return  await withCheckedContinuation { (continuation: PostContinuation) in
        getPersistedPosts { posts, _ in
            continuation.resume(returning: posts)
        }
    }
}


