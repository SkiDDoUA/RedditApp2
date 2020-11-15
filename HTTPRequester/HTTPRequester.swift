import Foundation

//struct RedditPost: Decodable {
//    var data: DataStruct
//        
//    struct DataStruct: Decodable {
//        var children: [ItemStruct]
//        var after: String?
//        var before: String?
//        
//        struct ItemStruct: Decodable {
//            var data: ItemDataStruct
//        
//            struct ItemDataStruct: Decodable {
//                var author: String
//                var domain: String
//                var created_utc: Double
//                var title: String
//                var url: String
//                var ups: Int
//                var downs: Int
//                var num_comments: Int
//            }
//        }
//    }
//}

class HTTPRequester {
    static let sharedInstance = HTTPRequester()
    var url_part1 = "https://www.reddit.com/r/"
    var url_part2 = "/top.json?limit="
    var url_part3 = "?after="
    
    func postRequest (subreddit: String, limit: String, after: Bool, parameters: [String: Any]? = nil, finished: @escaping (Bool) -> Void) {
        let link = url_part1 + subreddit + url_part2 + limit
        guard let destination = URL(string: link) else { return }
            
        let task = URLSession.shared.dataTask(with: destination) { (data, response, error) in
            if let data = data {
                do {
                    let res = try JSONDecoder().decode(RedditPost.self, from: data)
                    if after == false {
                        Service.saveResponse(responseData: data, saveCompletion: {(success) -> Void in
                            if (success) {
                                finished(true);
                            } else {
                                print("success error")
                            }
                        })
                    } else {
                        var afterName: String!
                            afterName = res.data.after!
                        guard let destination1 = URL(string: link + self.url_part3 + afterName!) else { return }
                            
                        let task1 = URLSession.shared.dataTask(with: destination1) {(data, response, error) in
                            if let data = data {
                                do {
                                    Service.saveResponse(responseData: data, saveCompletion: {(success) -> Void in
                                        if (success) {
                                            finished(true);
                                        } else {
                                            print("success error")
                                        }
                                    })
                                }
                                return
                            }
                        }
                        task1.resume()
                    }
                } catch let error {
                    print(error)
                }
                return
            }
        }
        task.resume()
    }
}
