
import UIKit


//storyCollectionView에 사용할 배열
var storyArray:[StoryModel] = [StoryModel(profile: "profile", nickName: "pengsu"),StoryModel(profile: "profile", nickName: "pengsu"), StoryModel(profile: "profile", nickName: "pengsu"), StoryModel(profile: "profile", nickName: "pengsu"), StoryModel(profile: "profile", nickName: "pengsu"), StoryModel(profile: "profile", nickName: "pengsu"), StoryModel(profile: "profile", nickName: "pengsu")]

var feedArray:[FeedModel] = [FeedModel(profileImage: "profile", profileName: "pengsu", feedImage: "pengsu", feedText: "안녕하세요. 펭수입니다.1", comment: [CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다1", commentHeart: 0),CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다1-1", commentHeart: 0)]), FeedModel(profileImage: "profile", profileName: "pengsu", feedImage: "pengsu", feedText: "안녕하세요. 펭수입니다.2", comment: [CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다2", commentHeart: 0),CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다2-1", commentHeart: 0)]), FeedModel(profileImage: "profile", profileName: "pengsu", feedImage: "pengsu", feedText: "안녕하세요. 펭수입니다.3", comment: [CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다3", commentHeart: 0)])]






class MainViewPresenter : NSObject {
    
    private let cellIdentifier = "storyCell"
    private let presenter = FeedCommentPresenter()

    
}



//collectionView에 들어갈 데이터 세팅
extension MainViewPresenter : UICollectionViewDataSource {
    
    //story collectionView에 들어갈 아이템의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! StoryCell
        
        cell.profileImageView?.image = UIImage(named: storyArray[indexPath.row].profile)
        cell.profileImageView?.layer.cornerRadius = (cell.profileImageView?.frame.height)! / 2
        cell.profileImageView?.clipsToBounds = true //지정한 경계선에 이미지를 맞추기
        
        cell.nickNameLabel?.text = storyArray[indexPath.row].nickName
        
        return cell
    }
    
    
}



//feed tableView에 들어갈 데이터 세팅
extension MainViewPresenter : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return feedArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as! FeedCell
        
        cell.setTableViewDataSourceDelegate(presenter, forSection: indexPath.section)
        
        let feedData = feedArray[indexPath.section]
        cell.profileImageView?.image = UIImage(named: feedData.profileImage!)
        cell.profileLabel?.text = feedData.profileName
        cell.feedImageView?.image = UIImage(named: feedData.feedImage)
        cell.feedLabel?.text = "\(feedData.profileName!)  " + "\(feedData.feedText!)"
        
        
        return cell
    }
    
    
    
}
