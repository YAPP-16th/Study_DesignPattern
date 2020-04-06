
import UIKit

class FeedCell : UITableViewCell {
    @IBOutlet weak var profileImageView:UIImageView?
    @IBOutlet weak var profileLabel: UILabel?
    @IBOutlet weak var feedImageView: UIImageView?
    @IBOutlet weak var heartButton: UIButton?
    @IBOutlet weak var commentButton: UIButton?
    @IBOutlet weak var feedLabel: UILabel?
    @IBOutlet weak var allCommentButton: UIButton?
    @IBOutlet weak var previewCommentTableView: UITableView?
    @IBOutlet weak var moreCommentButton: UIButton?
    
    var section: Int = 0
}





extension FeedCell{
    func setTableViewDataSourceDelegate(_ dataSourceDelegate: FeedCommentPresenter, forSection section: Int){
        previewCommentTableView?.delegate = dataSourceDelegate
        previewCommentTableView?.dataSource = dataSourceDelegate
        dataSourceDelegate.section = section
        previewCommentTableView?.reloadData()
    }
}
