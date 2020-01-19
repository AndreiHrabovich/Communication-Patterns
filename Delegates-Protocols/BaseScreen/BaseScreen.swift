
import UIKit

class BaseScreen: UIViewController {

    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var chooseButton: UIButton!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height/2
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "SelectionScreen", bundle: nil)
        let selectionVC = storyboard.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        
        selectionVC.chosenSide = { [weak self] (imageName, labelText, color) in
            self?.mainImageView.image = UIImage(named: imageName)
            self?.nameLabel.text = labelText
            self?.view.backgroundColor = color
        }
        
        present(selectionVC, animated: true, completion: nil)
    }
}

