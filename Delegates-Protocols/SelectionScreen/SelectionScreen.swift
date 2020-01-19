
import UIKit

class SelectionScreen: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func imperialButtonTapped(_ sender: UIButton) {
        setNotificationForKey(key: darkNotificationKey)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func rebelButtonTapped(_ sender: UIButton) {
        setNotificationForKey(key: lightNotificationKey)
        dismiss(animated: true, completion: nil)
    }
    
    private func setNotificationForKey(key: String) {
        let name = Notification.Name(rawValue: key)
        NotificationCenter.default.post(name: name, object: nil)
    }
}
