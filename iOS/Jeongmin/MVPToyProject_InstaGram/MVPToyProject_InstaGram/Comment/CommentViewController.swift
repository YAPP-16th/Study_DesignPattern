

import UIKit

class CommentViewController : UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var feedTextLabel: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentSubmitButton: UIButton!
    
    private let presenter = CommentViewPresenter()
    
    
    
    override func viewDidLoad() {
        commentTableView.delegate = self
     //   commentTableView.dataSource = presenter
    }
    
    
    
    
    
}

extension CommentViewController : UITableViewDelegate {
    
}
