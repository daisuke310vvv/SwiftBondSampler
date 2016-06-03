import UIKit
import Bond

class BindingViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!

    @IBOutlet var label: UILabel!
    @IBOutlet var mapedLabel: UILabel!
    @IBOutlet var filteredLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.bnd_text
            .bindTo(label.bnd_text)
        
        textField.bnd_text
            .map { $0?.lowercaseString }
            .bindTo(mapedLabel.bnd_text)
        
        textField.bnd_text
            .filter { $0?.characters.count > 5 }
            .bindTo(filteredLabel.bnd_text)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
