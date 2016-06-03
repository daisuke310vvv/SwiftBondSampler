import UIKit
import Bond
import Alamofire
import SwiftyJSON

class ListViewModel: NSObject {

    internal let lists = ObservableArray<List>()
    
    private let urlString = "https://itunes.apple.com/search"
    private let parameters = ["term":"Swift",
                              "entity":"musicTrack",
                              "limit":"15"]

    internal func reload() {
        Alamofire.request(.GET, urlString, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let jsons = JSON(value)
                    for i in 0...jsons["results"].count {
                        let list = List(json: jsons["results"][i])
                        self.lists.append(list)
                    }
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
}
