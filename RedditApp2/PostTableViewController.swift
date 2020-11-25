//
//  PostTableViewController.swift
//  RedditApp2
//
//  Created by Anton Kolesnikov on 06.11.2020.
//

import UIKit

class PostTableViewController: UITableViewController {
    
//    var posts: [AllPosts.FullPost.PostStruct] = []
    var posts = [PostStruct]()
    
//
//    private lazy var posts = {
//        if let filePath = Bundle.main.url(forResource: "Posts77", withExtension: "json") {
//            if let data = try? Data(contentsOf: filePath) {
//                do {
////                        posts = try JSONDecoder().decode([PostStruct].self, from: data)
////                        print(posts)
//
//                        var array = try JSONDecoder().decode([PostStruct].self, from: data)
//                        for (post) in array.enumerated() {
//                            array.append(PostStruct.init(username: "\(post.element.username)", time: "\(post.element.time)", domain: "\(post.element.domain)", title: "\(post.element.title)", rating: "\(post.element.rating)", comments: "\(post.element.comments)", image: "\(post.element.image)", isChecked: "\(post.element.isChecked)"))
//                            print("Array: \(array)")
//                        }
//                        return array
//                } catch {
//                    print(error)
//                }
//            }
//            tableView.reloadData()
//        }
//        return posts
//    }()
    
//    private lazy var posts: [AllPosts.FullPost.PostStruct] = []
    
//    private let posts = Array(repeating: PostStruct(username: "skiddo", time: "5", domain: "dom", title: "TestPost", rating: "1k", comments: "2k", image: "https://i.redd.it/ezwjw4nipoy51.jpg", isChecked: "True"), count: 10)
    
//        func getPostFromJson(subreddit: String, limit: String) {
//            Repository.getPost(subreddit: subreddit, limit: limit, finished: { [self] (success) -> Void in
//                if success {
//                    if let result = Repository.loadJSON(loadJSONData: PersistenceManager.shared.cachedResponse) {
//                        parseJsonToData(responseJSON: result);
//                    }
//                } else {
//                    Swift.debugPrint("usecase error");
//                }
//            });
//        };
        
    
//    private lazy var posts: [AllPosts.FullPost.PostStruct] = {
//        var array = [AllPosts.FullPost.PostStruct]()
//        for post in 0..<100 {
//            array.append(AllPosts.FullPost.PostStruct.init(username: "\(post.element.dataPost.username)", time: "\(post.element.dataPost.time)", domain: "\(post.element.dataPost.domain)", title: "\(post.element.dataPost.title)", rating: "\(post.element.dataPost.rating)", comments: "\(post.element.dataPost.comments)", image: "\(post.element.dataPost.image)", isChecked: "\(post.element.dataPost.isChecked)"))
//            Swift.debugPrint(array)
//        }
//        return array
//    }()
    
//        }
    
//    static func workWithResponse(responseJSON: AllPosts) {
//        var posts: [AllPosts.FullPost.PostStruct] = {
//            var array = [AllPosts.FullPost.PostStruct]()
//            for (post) in responseJSON.postList.enumerated() {
//                array.append(AllPosts.FullPost.PostStruct.init(username: "\(post.element.dataPost.username)", time: "\(post.element.dataPost.time)", domain: "\(post.element.dataPost.domain)", title: "\(post.element.dataPost.title)", rating: "\(post.element.dataPost.rating)", comments: "\(post.element.dataPost.comments)", image: "\(post.element.dataPost.image)", isChecked: "\(post.element.dataPost.isChecked)"))
//            }
//            return array
//        }()
//    }

    override func viewDidLoad() {
        print(NSHomeDirectory())
        Presentation.getPost(subreddit: "ios", limit: "5")
        super.viewDidLoad()
//        print("sdsd")
//        print(Bundle.main.bundlePath)


//        let file1URL = Bundle.main.url(forResource: "Posts", withExtension: "json")
//        print("1")
////        let file2URL = Bundle.main.url(forResource: "demojson", withExtension: "json")
//        if let file1URL = file1URL,
//            let fileData = try? Data.init(contentsOf: file1URL),
//        let jsonArray = try? JSONSerialization.jsonObject(with: fileData, options: .mutableLeaves) as? [[String: Any]] {
//            print("3")
////            displayLabel.text = json?.description
//            for json in jsonArray {
//                let username = json["username"] as? String ?? ""
//                let time = json["time"] as? String ?? ""
//                let domain = json["domain"] as? String ?? ""
//                let title = json["title"] as? String ?? ""
//                let rating = json["rating"] as? String ?? ""
//                let comments = json["comments"] as? String ?? ""
//                let image = json["image"] as? String ?? ""
//                let isChecked = json["isChecked"] as? String ?? ""
//
//                let post = PostStruct(username: username, time: time, domain: domain, title: title, rating: rating, comments: comments, image: image, isChecked: isChecked)
//                posts.append(post)
//            }
//        }
//        tableView.reloadData()
        
//        do {
//            if let filePath = Bundle.main.path(forResource: "Posts", ofType: "json") {
//                print("2333")
//                let data = try? Data(contentsOf: filePath)
//                posts = try JSONDecoder().decode([PostStruct].self, from: data!)
//                print(posts)
//            }
//            tableView.reloadData()
//         } catch {print(error)}
        
//        if let path = Bundle.main.path(forResource: "Posts22", ofType: "json") {
//            do {
//                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
//                do {
//                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
//                    print("333")
//                    if let people : [NSDictionary] = jsonResult["post"] as? [NSDictionary] {
//                        print("123")
//                        for person: NSDictionary in people {
//                            for (username, value) in person {
//                                print("\(username) , \(value)")
//                            }
//                        }
//                    }
//                } catch {}
//            } catch {}
//        }

//        posts = {
//            if let filePath = Bundle.main.url(forResource: "Posts77", withExtension: "json") {
//                if let data = try? Data(contentsOf: filePath) {
//                    do {
////                        posts = try JSONDecoder().decode([PostStruct].self, from: data)
////                        print(posts)
//
//                            var array = try JSONDecoder().decode([PostStruct].self, from: data)
//                            for (post) in array.enumerated() {
//                                array.append(PostStruct.init(username: "\(post.element.username)", time: "\(post.element.time)", domain: "\(post.element.domain)", title: "\(post.element.title)", rating: "\(post.element.rating)", comments: "\(post.element.comments)", image: "\(post.element.image)", isChecked: "\(post.element.isChecked)"))
//                                print("Array: \(array)")
//                            }
//                            return array
//                    } catch {
//                        print(error)
//                    }
//                }
//                tableView.reloadData()
//            }
//            return posts
//        }()
        
//        if let filePath = Bundle.main.url(forResource: "Posts88", withExtension: "json") {
//            if let data = try? Data(contentsOf: filePath) {
//                print("123")
//                do {
//                    posts = try JSONDecoder().decode([PostStruct].self, from: data)
//                    print("Posts: \(posts.count)")
//                    tableView.reloadData()
//                } catch {
//                    print(error)
//                }
//            }
//        }
        
        if let filePath = Bundle.main.url(forResource: "Posts", withExtension: "json") {
            print("1")
            if let data = try? Data(contentsOf: filePath) {
                print("2")
                do {
                    posts = try JSONDecoder().decode([PostStruct].self, from: data)
                    tableView.reloadData()
                } catch {
                    print(error)
                }
            }
        }
                
//        do {
//            let data = try Data(contentsOf: Bundle.main.url(forResource: "Posts55", withExtension: "json")!)
//                posts = try JSONDecoder().decode([AllPosts.FullPost.PostStruct].self, from: data)
//                tableView.reloadData()
//            } catch { print(error) }
//
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        print("Posts: \(posts.count)")
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell13")
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as! PostTableViewCell
        print("cell1")
        cell.configure(for: posts[indexPath.row])
        print("cell2")
        
//        cell.CellTitle?.text = posts[indexPath.row].title

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
