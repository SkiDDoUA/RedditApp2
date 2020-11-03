import Foundation

class PersistenceManager {
    static var shared = PersistenceManager();

    var cachedResponse: Data {
        didSet {
            print("$ Response caching - Done")
        }
    };
    
    private init() {
        cachedResponse = Data();
    };
}
