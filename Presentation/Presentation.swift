import Foundation

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}

class Presentation {
    static func getPost(subreddit: String, limit: String) {
        Repository.getPost(subreddit: subreddit, limit: limit, finished: { (success) -> Void in
            if success {
                if let result = Repository.decodePost(responseData: PersistenceManager.shared.cachedResponse) {
                    workWithResponse(responseJSON: result);
                }
            } else {
                print("usecase error");
            }
        });
    };
    
    
    static func workWithResponse(responseJSON: RedditPost) {
        var postJSON = [[String : [String : String]]]()
        
        for (index, post) in responseJSON.data.children.enumerated() {
            let exampleDate = NSDate(timeIntervalSince1970: post.data.created_utc)
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            let timePassed = formatter.localizedString(for: exampleDate as Date, relativeTo: Date())
            
            postJSON.append(contentsOf: [["post \(index + 1)": ["username": "\(post.data.author)",
                                                    "time": "\(timePassed)",
                                                    "domain": "\(post.data.domain)",
                                                    "title": "\(post.data.title)",
                                                    "rating": "\(post.data.ups - post.data.downs)",
                                                    "comments": "\(post.data.num_comments)",
                                                    "image": "\(post.data.url)",
                                                    "isChecked": "False"]]])
        }
            
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectoryUrl.appendingPathComponent("Posts.json")
                
        do {
            if let jsonData = try JSONSerialization.data(withJSONObject: postJSON, options: .init(rawValue: 0)) as? Data {
                try jsonData.write(to: fileUrl, options: [])
            }
        } catch let error {
            print("json saving to directory error: \(error)")
        }
    }
};










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

