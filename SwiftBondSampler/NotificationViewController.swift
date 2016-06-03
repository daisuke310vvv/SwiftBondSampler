import UIKit
import Bond

class NotificationViewController: UIViewController {
    
    let notifName = "MyNotif"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().bnd_notification(notifName, object: nil)
            .observe { notif in
                let alert = UIAlertController(title: "Notification!", message: nil, preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendNotif(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName(notifName, object: nil)
    }
}
