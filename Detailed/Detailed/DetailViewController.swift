import UIKit

class DetailViewController: UIViewController {
    
    var character : Model.Animation?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var characterViewBig: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //set title, making sure there is a character to return
        guard let character = character else {return}
        //load image view with animation
        let cells = Model.shared.cells(for: character)
        characterViewBig.animationImages = cells
        characterViewBig.animationRepeatCount = 0
        characterViewBig.animationDuration = 4
        characterViewBig.startAnimating()
        
        //setting up the label so the name shows
        nameLabel.text = character.rawValue
    }
}
