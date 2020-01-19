
import UIKit

class SelectionScreen: UIViewController {
    
    var chosenSide: ((String, String, UIColor) -> Void)! // used implicitly unwrapped optional because it will never been nil when used // or you can change it to ? and call chosenSide?(...)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func imperialButtonTapped(_ sender: UIButton) {
        chosenSide("vader", "Dart Wader", UIColor.red)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func rebelButtonTapped(_ sender: UIButton) {
        chosenSide("luke", "Luke SkyWalker", UIColor.blue)
        dismiss(animated: true, completion: nil)
    }
}
