import Foundation

class Service {
    //get data from request
    //parse data to db
    
    static func saveResponse(responseData: Data, saveCompletion: (Bool) -> Void) {
        PersistenceManager.shared.cachedResponse = responseData;
        if PersistenceManager.shared.cachedResponse == responseData {
            saveCompletion(true);
        } else {
            saveCompletion(false);
        }
    }
}
