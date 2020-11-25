import Foundation

struct RedditPost: Codable {
    var data: DataStruct
        
    struct DataStruct: Codable {
        var children: [ItemStruct]
        var after: String?
        var before: String?
        
        struct ItemStruct: Codable {
            var data: ItemDataStruct
        
            struct ItemDataStruct: Codable {
                var author: String
                var domain: String
                var created_utc: Double
                var title: String
                var url: String
                var ups: Int
                var downs: Int
                var num_comments: Int
            }
        }
    }
}

//struct FullPost: Decodable {
//    var postIndex: String
//    var dataPost: [PostStruct]
//
//    struct PostStruct: Decodable {
//        var username: String
//        var time: String
//        var domain: String
//        var title: String
//        var rating: String
//        var comments: String
//        var image: String
//        var isChecked: String
//    }
//}

//struct AllPosts: Decodable {
//    var postList: [FullPost]
//
//    struct FullPost: Decodable {
//        var dataPost: PostStruct
//
//        struct PostStruct: Decodable {
//            var username: String
//            var time: String
//            var domain: String
//            var title: String
//            var rating: String
//            var comments: String
//            var image: String
//            var isChecked: String
//        }
//    }
//}

struct AllPosts: Codable {
    var postList: [FullPost]
}

struct FullPost: Codable {
    var dataPost: [PostStruct]
}

struct PostStruct: Codable {
    var username: String
    var time: String
    var domain: String
    var title: String
    var rating: String
    var comments: String
    var image: String
    var isChecked: String
}
  

//struct PreviewPost: Decodable {
//    var title: String
//    var image: String
////    var isChecked: String
//}
