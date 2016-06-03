import UIKit
import Bond

class ListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    private let listViewModel = ListViewModel()
    private var list = ObservableArray<ObservableArray<List>>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.list = [listViewModel.lists]
        listViewModel.reload()
        
        list.bindTo(tableView) { indexPath, dataSources, tableView in
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
            let dataSource = dataSources[indexPath.section][indexPath.row]
            cell.textLabel?.text = dataSource.trackName
            cell.detailTextLabel?.text = dataSource.artistName

            return cell
        }

    }

    
}
