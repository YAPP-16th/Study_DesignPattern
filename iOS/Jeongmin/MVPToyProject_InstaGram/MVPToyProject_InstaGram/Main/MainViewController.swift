

import UIKit

class MainViewController: UIViewController{
 
    
    func pushCommentVC() {
        guard let commentVC = storyboard?.instantiateViewController(withIdentifier: "commentDetail") as? CommentViewController else { return }
        navigationController?.pushViewController(commentVC, animated: true)
    }

    
    //collectionView와 tableView 선언
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    
    //presenter
    let presenter = MainViewPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setUpTableView()
        storyCollectionView.reloadData()
        feedTableView.reloadData()
    }
    


    //collectionView 설정
    func setUpCollectionView(){
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = presenter
    }
    
    //tableView 설정
    func setUpTableView(){
        feedTableView.delegate = self
        feedTableView.dataSource = presenter
    }
    


}


extension MainViewController : UITableViewDelegate {
    
}


extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = UIScreen.main.bounds.width / 5.9
        let itemHeight = UIScreen.main.bounds.height / 9.96
        let size = CGSize(width: itemWidth, height: itemHeight)
        return size
    }
    
}
