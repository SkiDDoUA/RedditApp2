//
//  PostTableViewController.swift
//  RedditApp2
//
//  Created by Anton Kolesnikov on 06.11.2020.
//

import UIKit

class PostTableViewController: UITableViewController {    
    private lazy var posts: [AllPosts.FullPost.PostStruct] = []
    
//    private let posts = Array(repeating: FullPost(username: "skiddo", time: "5", domain: "dom", title: "TestPost", rating: "1k", comments: "2k", image: "https://i.redd.it/ezwjw4nipoy51.jpg", isSaved: "True"), count: 10)
    
        func getPost(subreddit: String, limit: String) {
            Repository.getPost(subreddit: subreddit, limit: limit, finished: { [self] (success) -> Void in
                if success {
                    if let result = Repository.loadJSON(loadJSONData: PersistenceManager.shared.cachedResponse) {
                        workWithResponse(responseJSON: result);
                    }
                } else {
                    Swift.debugPrint("usecase error");
                }
            });
        };
        
        func workWithResponse(responseJSON: AllPosts) {
            posts = {
                var array = [AllPosts.FullPost.PostStruct]()
                for (post) in responseJSON.postList.enumerated() {
                    array.append(AllPosts.FullPost.PostStruct.init(username: "\(post.element.dataPost.username)", time: "\(post.element.dataPost.time)", domain: "\(post.element.dataPost.domain)", title: "\(post.element.dataPost.title)", rating: "\(post.element.dataPost.rating)", comments: "\(post.element.dataPost.comments)", image: "\(post.element.dataPost.image)", isChecked: "\(post.element.dataPost.isChecked)"))
                }
                Swift.debugPrint(posts)
                return array
            }()
        }
    
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
        Presentation.getPost(subreddit: "ios", limit: "5")
        
        super.viewDidLoad()
        
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
        return self.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as! PostTableViewCell
        
        cell.configure(for: self.posts[indexPath.row])

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
