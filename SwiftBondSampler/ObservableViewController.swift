import UIKit
import Bond

class ObservableViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    let captain = Observable("Jim")

    override func viewDidLoad() {
        super.viewDidLoad()

        captain.bindTo(label.bnd_text)
        
        captain.skip(1).observe { name in
            print("Now the captain is \(name).")
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func change() {
        captain.next("Spock")
    }

}
