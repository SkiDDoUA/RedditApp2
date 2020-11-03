import Foundation

class Repository {
    //handle and decode data for usecase
    
    static func decodePost(responseData: Data) -> RedditPost? {
        let jsonDecoder = JSONDecoder();
        do {
            let parsedJSON = try jsonDecoder.decode(RedditPost.self, from: responseData);
            return parsedJSON;
        } catch {
            print(error);
            return nil;
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
}
