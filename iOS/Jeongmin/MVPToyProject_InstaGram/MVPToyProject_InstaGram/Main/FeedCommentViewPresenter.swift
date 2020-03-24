

import UIKit

class FeedCommentPresenter : NSObject {
    var section = 0
}

//댓글 tableView에 들어갈 데이터 세팅
extension FeedCommentPresenter : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedArray[self.section].comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tag에 따라 다른 셀을 리턴
        let cell = tableView.dequeueReusableCell(withIdentifier: "InsideFeedCell") as! InsideFeedCell
        let commentData = feedArray[self.section].comment[indexPath.row]
        print(indexPath.row)
        print("- 댓글뷰의 인덱스 \(indexPath.row)")
        
        let commentAuthor = "\(commentData.commentAutor!)" + "  "
        let comment = "\(commentData.comment!)"
        cell.commentLabel.text = commentAuthor + comment
        
        return cell
        
    }
    
    
}

