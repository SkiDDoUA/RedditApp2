import UIKit

class PostTableViewCell: UITableViewCell {
    static let reuseIdentifier = "postCell"
    var isSaved = "False"
    
    @IBOutlet weak var saveButtonAction: UIButton!

    @IBOutlet weak var CellImageView: UIImageView!
    @IBOutlet weak var CellTitle: UILabel!
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        if (isSaved == "False") {
            sender.setImage(UIImage(named: "savedLight.png"), for: .normal)
            isSaved = "True"
        } else {
            sender.setImage(UIImage(named: "unsavedLight.png"), for: .normal)
            isSaved = "False"
        }
    }

    func configure(for post: AllPosts.FullPost.PostStruct) {
        self.CellTitle.text = "\(post.title)"
                
        if post.image.contains(".jpg") {
            let url = URL(string: "\(post.image)")
                let data = try? Data(contentsOf: url!)
                self.CellImageView.image = UIImage(data: data!)
        } else {
            self.CellImageView.image = UIImage(named: "noImage")
        }
                
        self.CellImageView.contentMode = .scaleAspectFill
        self.CellImageView.clipsToBounds = true
    };
}
    
//    func newPost() {
//        self.CellImageView.image = UIImage(named: "noImage")
//        self.CellTitle.text = "Post 1"
//    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//        bounds = bounds.inset(by: padding)
//    }
    
//    func loadJSON(fileName: String) -> FullPost? {
//       let decoder = JSONDecoder()
//       guard
//            let url = Bundle.main.url(forResource: "Posts", withExtension: "json"),
//            let data = try? Data(contentsOf: url),
//            let post = try? decoder.decode(FullPost.self, from: data)
//       else {
//            return nil
//       }
//       return post
//    }

    
//    func configure(for post: FullPost) {
//        DispatchQueue.main.async {
//            self.CellTitle.text = "\(post.title)"
//
//            if post.image.contains(".jpg") {
//                let url = URL(string: "\(post.image)")
//                    let data = try? Data(contentsOf: url!)
//                    self.CellImageView.image = UIImage(data: data!)
//            } else {
//                self.CellImageView.image = UIImage(named: "noImage")
//            }
//
//            self.CellImageView.contentMode = .scaleAspectFill
//            self.CellImageView.clipsToBounds = true
//            }
//        };
//}

//    Presentation.getPost(subreddit: "ios", limit: "5")
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        func loadJSON(fileName: String) -> FullPost? {
//           let decoder = JSONDecoder()
//           guard
//                let url = Bundle.main.url(forResource: "Posts", withExtension: "json"),
//                let data = try? Data(contentsOf: url),
//                let post = try? decoder.decode(FullPost.self, from: data)
//           else {
//                return nil
//           }
//
//           return post
//        }
//
//        func configure(for post: FullPost) {
//            DispatchQueue.main.async {
//                self.CellTitle.text = "\(post.title)"
//
//                if post.image.contains(".jpg") {
//                    let url = URL(string: "\(post.image)")
//                        let data = try? Data(contentsOf: url!)
//                        self.CellImageView.image = UIImage(data: data!)
//                } else {
//                    self.CellImageView.image = UIImage(named: "noImage")
//                }
//
//                self.CellImageView.contentMode = .scaleAspectFill
//                self.CellImageView.clipsToBounds = true
//                }
//            };
//        Presentation.getPost(subreddit: "ios", limit: "5")
//        }
//    }

    

        
        
        
        
        
//        func getPost(subreddit: String, limit: String) {
//            Repository.getPost(subreddit: subreddit, limit: limit, finished: { (success) -> Void in
//                if success {
//                    if let result = Repository.decodePost(responseData: PersistenceManager.shared.cachedResponse) {
//                        loadPost(responseJSON: result);
//                    }
//                } else {
//                    print("usecase error");
//                }
//            });
//        };
//
//        func loadPost(responseJSON: RedditPost) {
//            _ = "$ \(responseJSON.data.children.count) Posts:";
//            for (_, post) in responseJSON.data.children.enumerated() {
//                DispatchQueue.main.async {
//                    self.CellTitle.text = "\(post.data.title)";
//
//                    if post.data.url.contains(".jpg") {
//                        let url = URL(string: "\(post.data.url)")
//                            let data = try? Data(contentsOf: url!)
//                            self.CellImageView.image = UIImage(data: data!)
//                    } else {
//                        self.CellImageView.image = UIImage(named: "noImage")
//                    }
//
//                    self.CellImageView.contentoe = .scaleAspectFill
//                    self.CellImageView.clipsToBounds = true
//                    }
//                }
//            }
//        getPost(subreddit: "ios", limit: "10")
//    }
    
    
//        override func prepareForReuse() {
//            self.CellImageView = nil
//            self.CellTitle = nil
//        }
//    }
//}
