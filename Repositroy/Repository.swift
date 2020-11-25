import Foundation

extension URL {
    static var documents: URL {
        return FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

class Repository {
    
    static func decodePost(responseData: Data) -> RedditPost? {
        do {
            let parsedJSON = try JSONDecoder().decode(RedditPost.self, from: responseData)
            return parsedJSON
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getPost(subreddit: String, limit: String, finished: @escaping (Bool) -> Void) {
        HTTPRequester.sharedInstance.postRequest(subreddit: subreddit, limit: limit, after: false, finished: {(success) -> Void in
            if success {
                finished(true);
            } else {
                print("success error")
            }
        })
    }
    
    static func savePost(JSONToSave: [RedditPost]) throws {
        let fileUrl = URL.documents.appendingPathComponent("Posts1.json")
        let jsonData = try JSONEncoder().encode(JSONToSave)
        try jsonData.write(to: fileUrl, options: [])
    }
    
//    static let bundleJson = Bundle.main.url(forResource: "Posts88", withExtension: "json" )
//    static let fileJson = FileManager.default.urls (for: .documentDirectory, in: .userDomainMask) .first!.appendingPathComponent("Posts88")
//
//    private init() {}
//
//    func loadSaved() {
//        do {
//            let data = FileManager.default .contents(atPath: Repository.fileJson.path)
//            if let data = data {
//                let decoder = JSONDecoder()
//                let savedRes = try decoder.decode(Array<RedditPostingModel>.self, from: data)
//            } else {
//            }
//        } catch {
//            print (error)
//        }
//    }
//
//    func writeSaved() {
//        do {
//            let encoder = JSONEncoder()
//            let data = try encoder.encode(saved)
//            try data.write(to: Repository.fileJson)
//
//        } catch {
//            print(error)
//        }
//    }
    
//    static func loadJSON() -> AllPosts? {
//       let decoder = JSONDecoder()
//       guard
//            let url = Bundle.main.url(forResource: "Posts44", withExtension: "json"),
//            let data = try? Data(contentsOf: url),
//            let post = try? decoder.decode(AllPosts.self, from: data)
//       else {
//            return nil
//       }
//       return post
//    }
}
