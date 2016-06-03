import UIKit
import Bond
import Alamofire
import SwiftyJSON

class AlbumViewModel: NSObject {
    
    internal let albums = ObservableArray<Album>()
    
    private let urlString = "https://itunes.apple.com/search"
    private let parameters = ["term":"Swift",
                              "entity":"musicTrack",
                              "limit":"30"]
    
    internal func reload() {
        Alamofire.request(.GET, urlString, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let jsons = JSON(value)
                    for i in 0...jsons["results"].count {
                        let album = Album(json: jsons["results"][i])
                        self.albums.append(album)
                    }
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
}
