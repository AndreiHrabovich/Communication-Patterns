
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
        guard let selectionVC = storyboard.instantiateViewController(withIdentifier: "SelectionScreen") as? SelectionScreen else { return }
        
        selectionVC.onSideChosen = { [weak self] (side) in
            self?.mainImageView.image = UIImage(named: side.name)
            self?.nameLabel.text = side.text
            self?.view.backgroundColor = side.isRebel ? UIColor.blue : UIColor.red
        }
        
        present(selectionVC, animated: true, completion: nil)
    }
}

