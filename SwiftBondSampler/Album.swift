import SwiftyJSON

struct Album {
    
    let trackName: String
    let artistName: String
    let artworklURL: String
    
    init(json: JSON) {
        self.trackName = json["trackName"].stringValue
        self.artistName = json["artistName"].stringValue
        self.artworklURL = json["artworkUrl100"].stringValue
    }
    
}