import UIKit

class ViewController: UIViewController {

    @IBOutlet var postView: UIView!
    @IBOutlet var mainViewController: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var domainLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!

    @IBOutlet weak var saveButton: UIButton!
    
    var saved:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.sizeToFit()
        titleLabel.sizeToFit()
        
        func getPost(subreddit: String, limit: String) {
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

        func loadPost(responseJSON: RedditPost) {
            _ = "$ \(responseJSON.data.children.count) Posts:";
            for (_, post) in responseJSON.data.children.enumerated() {
                    
                let exampleDate = NSDate(timeIntervalSince1970: post.data.created_utc)
                let formatter = RelativeDateTimeFormatter()
                formatter.unitsStyle = .full
                let timePassed = formatter.localizedString(for: exampleDate as Date, relativeTo: Date())
                    
                DispatchQueue.main.async {
                    self.usernameLabel.text = "u/\(post.data.author)"
                    self.timeLabel.text = "\(timePassed)";
                    self.domainLabel.text = "\(post.data.domain)";
                    self.titleLabel.text = "\(post.data.title)";
                    self.ratingLabel.text = "\(post.data.ups - post.data.downs)";
                    self.commentsLabel.text = "\(post.data.num_comments)";
                    
                    if post.data.url.contains(".jpg") {
                        let url = URL(string: "\(post.data.url)")
                            let data = try? Data(contentsOf: url!)
                            self.imageView.image = UIImage(data: data!)
                    } else {
                        self.imageView.image = UIImage(named: "noImage")
                    }
                    
                    self.imageView.contentMode = .scaleAspectFill
                    self.imageView.clipsToBounds = true
                    }
                }
            }
        getPost(subreddit: "ios", limit: "1")
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        saved = !saved
        if saved {
            sender.setImage(UIImage(named: "savedLight.png"), for: .normal)
            saved = true
        } else {
            sender.setImage(UIImage(named: "unsavedLight.png"), for: .normal)
            saved = false
        }
    }
}
