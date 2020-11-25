import Foundation

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}

//extension URL {
//    static var documents: URL {
//        return FileManager
//            .default
//            .urls(for: .documentDirectory, in: .userDomainMask)[0]
//    }
//}

class Presentation {
    static func getPost(subreddit: String, limit: String) {
        Repository.getPost(subreddit: subreddit, limit: limit, finished: {(success) -> Void in
            if success {
                if let result = Repository.decodePost(responseData: PersistenceManager.shared.cachedResponse) {
                    savePostsToIphone(responseJSON: [result])
                }
            } else {
                print("usecase error");
            }
        });
    };
    
    static func savePostsToIphone(responseJSON: [RedditPost]) {
        do {
            try Repository.savePost(JSONToSave: responseJSON)
        } catch {
            print("SEVERE: Failed to encode and save posts with error: \(error)")
        }

//        let fileUrl = URL.documents.appendingPathComponent("Posts.json")
//        do {
//            if let jsonData = try JSONSerialization.data(withJSONObject: postJSON, options: .init(rawValue: 0)) as? Data {
//                try jsonData.write(to: fileUrl, options: [])
//                print("JSON saved")
//            }
//        } catch let error {
//            print("json saving to directory error: \(error)")
//        }
//
//        if let path = Bundle.main.path(forResource: "Posts", ofType: "json") {
//            print("3")
//            do {
//                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                print("1")
//                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                print("2")
//                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["post"] as? [Any] {
//                            print(person)
//                  }
//              } catch {
//                   // handle error
//              }
//        }
//    }
    
//    static func savePostsToIphone(responseJSON: RedditPost) {
//        var postJSON = ""
//
//        for (index, post) in responseJSON.data.children.enumerated() {
//            let exampleDate = NSDate(timeIntervalSince1970: post.data.created_utc)
//            let formatter = RelativeDateTimeFormatter()
//            formatter.unitsStyle = .full
//            let timePassed = formatter.localizedString(for: exampleDate as Date, relativeTo: Date())
//
//            postJSON += "\n\nPost \(index+1):"
//            postJSON += "\n  username: \(post.data.author)"
//            postJSON += "\n  time: \(timePassed)";
//            postJSON += "\n  domain: \(post.data.domain)";
//            postJSON += "\n  title: \(post.data.title)";
//            postJSON += "\n  image: \(post.data.url)";
//            postJSON += "\n  rating: \(post.data.ups - post.data.downs)";
//            postJSON += "\n  num_comments: \(post.data.num_comments)";
//            postJSON += "\n  isChecked: False";
//        }
//
//        let fileUrl = URL.documents.appendingPathComponent("Posts88.json")
//        do {
//            if let jsonData = try JSONSerialization.data(withJSONObject: postJSON, options: .init(rawValue: 0)) as? Data {
//                try jsonData.write(to: fileUrl, options: [])
//                print("JSON saved")
//            }
//        } catch let error {
//            print("json saving to directory error: \(error)")
//        }
//    }
    
//    let bundleJson = Bundle.main.url(forResource: "Posts88", withExtension: "json" )
//    let fileJson = FileManager.default.urls (for: .documentDirectory, in: .userDomainMask) .first!.appendingPathComponent("Posts88")
//
//        do {
//            let data = FileManager.default .contents(atPath: Repository.fileJson.path)
//            if let data = data {
//                let decoder = JSONDecoder()
//                let savedRes = try decoder.decode(Array<postJSON>.self, from: data)
//            } else {
//            }
//        } catch {
//            print (error)
//        }
                    
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
    
//    static func savePostsToIphone(responseJSON: RedditPost) {
//        var postJSON = ""
//
//        for (index, post) in responseJSON.data.children.enumerated() {
//            let exampleDate = NSDate(timeIntervalSince1970: post.data.created_utc)
//            let formatter = RelativeDateTimeFormatter()
//            formatter.unitsStyle = .full
//            let timePassed = formatter.localizedString(for: exampleDate as Date, relativeTo: Date())
//
//            postJSON += "\n\nPost \(index+1):"
//            postJSON += "\n  username: \(post.data.author)"
//            postJSON += "\n  time passed: \(timePassed)";
//            postJSON += "\n  domain: \(post.data.domain)";
//            postJSON += "\n  title: \(post.data.title)";
//            postJSON += "\n  image: \(post.data.url)";
//            postJSON += "\n  rating: \(post.data.ups - post.data.downs)";
//            postJSON += "\n  num_comments: \(post.data.num_comments)";
//        }
//
//        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
//                                                            in: .userDomainMask).first {
//            print("123")
//            let pathWithFilename = documentDirectory.appendingPathComponent("PostsNEW.json")
//            do {
//                try postJSON.write(to: pathWithFilename,
//                                     atomically: true,
//                                     encoding: .utf8)
//                print("JSON saved")
//            } catch {
//               print("Error savePostsToIphone")
//            }
//    }
//};

//    static func savePostsToIphone(responseJSON: RedditPost) {
//        var postJSON = [[String : [String : String]]]()
//
//        for (index, post) in responseJSON.data.children.enumerated() {
//            let exampleDate = NSDate(timeIntervalSince1970: post.data.created_utc)
//            let formatter = RelativeDateTimeFormatter()
//            formatter.unitsStyle = .full
//            let timePassed = formatter.localizedString(for: exampleDate as Date, relativeTo: Date())
//
//            postJSON.append(contentsOf: [["post \(index + 1)": ["username": "\(post.data.author)",
//                                                    "time": "\(timePassed)",
//                                                    "domain": "\(post.data.domain)",
//                                                    "title": "\(post.data.title)",
//                                                    "rating": "\(post.data.ups - post.data.downs)",
//                                                    "comments": "\(post.data.num_comments)",
//                                                    "image": "\(post.data.url)",
//                                                    "isChecked": "False"]]])
//        }
//
//        let fileUrl = URL.documents.appendingPathComponent("Posts88.json")
//        do {
//            if let jsonData = try JSONSerialization.data(withJSONObject: postJSON, options: .init(rawValue: 0)) as? Data {
//                try jsonData.write(to: fileUrl, options: [])
//                print("JSON saved")
//            }
//        } catch let error {
//            print("json saving to directory error: \(error)")
//        }
//    }
}
}

//Сделать что бы можно было читать джсон файл с айфона
//Все нормально раскидать по папкам
//Дальше делать делишки по видео Фран

//Repository.getPost(subreddit: "ios", limit: "5")

//var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
//                                  "answers":["True", "False"],
//                                  "correctIndex":0,
//                                  "module":3,
//                                  "lesson":0,
//                                  "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
//                                 ]

