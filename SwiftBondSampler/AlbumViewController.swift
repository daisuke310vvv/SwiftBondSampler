import UIKit
import Bond
import AlamofireImage

class AlbumViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    private let albumViewModel = AlbumViewModel()
    private var album = ObservableArray<ObservableArray<Album>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.album = [albumViewModel.albums]
        albumViewModel.reload()
        
        album.bindTo(collectionView) { indexPath, dataSource, collectionView in
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! AlbumCollectionViewCell
            let dataSource = dataSource[indexPath.section][indexPath.item]
            cell.imageView.af_setImageWithURL(NSURL(string: dataSource.artworklURL)!)

            return cell
        }
        
    }
    
    
}
