import Foundation

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}

class UseCase {
    //print 1 top post
    
    static func getPost(subreddit: String, limit: String) {
        Repository.getPost(subreddit: subreddit, limit: limit, finished: { (success) -> Void in
            if success {
                if let result = Repository.decodePost(responseData: PersistenceManager.shared.cachedResponse) {
                    loadPost(responseJSON: result);
                }
            } else {
                print("usecase error");
            }
        });
    };
    
    
    static func loadPost(responseJSON: RedditPost) {
        var finalString = "$ \(responseJSON.data.children.count) Posts:";
        for (index, post) in responseJSON.data.children.enumerated() {
            
            let exampleDate = NSDate(timeIntervalSince1970: post.data.created_utc)
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            let timePassed = formatter.localizedString(for: exampleDate as Date, relativeTo: Date())
            
            finalString += "\n\nPost \(index+1):"
            finalString += "\n  username: \(post.data.author)"
            finalString += "\n  time passed: \(timePassed)";
            finalString += "\n  domain: \(post.data.domain)";
            finalString += "\n  title: \(post.data.title)";
            finalString += "\n  image: \(post.data.url)";
            finalString += "\n  rating: \(post.data.ups - post.data.downs)";
            finalString += "\n  num_comments: \(post.data.num_comments)";
        }
        print(finalString);
    };
}
//UseCase.get5Posts(subreddit: "ios", limit: "5")
