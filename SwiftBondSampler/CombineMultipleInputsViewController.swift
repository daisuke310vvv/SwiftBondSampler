import UIKit
import Bond

class CombineMultipleInputsViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        combineLatest(username.bnd_text, pass.bnd_text)
            .map { name, pass in
                return name?.characters.count > 0 && pass?.characters.count > 0
            }
            .bindTo(button.bnd_enabled)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
