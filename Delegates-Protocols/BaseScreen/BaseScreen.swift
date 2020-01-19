
import UIKit

// creating unique identifiers for notifications (globally)
let lightNotificationKey = "com.test.lightSide"
let darkNotificationKey = "com.test.darkSide"

class BaseScreen: UIViewController {
    
    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var chooseButton: UIButton!
    @IBOutlet private weak var nameLabel: UILabel!
    
    let dark = Notification.Name(darkNotificationKey)
    let light = Notification.Name(lightNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height/2
        createObservers()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateNameLabel(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updareBackground(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateNameLabel(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updareBackground(notification:)), name: dark, object: nil)
        
    }
    
    @objc private func updateCharacterImage(notification: Notification) {
        let isLight = notification.name == light
        mainImageView.image = isLight ? UIImage(named: "luke") : UIImage(named: "vader")
    }
    
    @objc private func updateNameLabel(notification: Notification) {
        let isLight = notification.name == light
        nameLabel.text = isLight ? "Luke Skywalker" : "Dart Vader"
    }
    
    @objc private func updareBackground(notification: Notification) {
        let isLight = notification.name == light
        view.backgroundColor = isLight ? UIColor.blue : UIColor.red
    }
    
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "SelectionScreen", bundle: nil)
        let selectionVC = storyboard.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        
        present(selectionVC, animated: true, completion: nil)
    }
}

