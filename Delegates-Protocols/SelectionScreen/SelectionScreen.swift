
import UIKit

class SelectionScreen: UIViewController {
    var onSideChosen: ((Side) -> Void)? // at first used implicitly unwrapped optional because it will never been nil when used // or you can change it to ? and call chosenSide?(...) - that was the frecommended option
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func imperialButtonTapped(_ sender: UIButton) {
        onSideChosen?(Side(name: "vader", text: "Dart Wader", isRebel: false))
        dismiss(animated: true, completion: nil)
    }

    @IBAction func rebelButtonTapped(_ sender: UIButton) {
        onSideChosen?(Side(name: "luke", text: "Luke SkyWalker", isRebel: true))
        dismiss(animated: true, completion: nil)
    }
}
