import SwiftyJSON

struct List {

    let trackName: String
    let artistName: String
    
    init(json: JSON) {
        self.trackName = json["trackName"].stringValue
        self.artistName = json["artistName"].stringValue
    }

}