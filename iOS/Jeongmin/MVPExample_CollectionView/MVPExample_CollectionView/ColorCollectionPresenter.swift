

import UIKit


class ColorCollectionPresenter: NSObject {
    let backgroundColor: UIColor = .white
    var model = ColorModel()
    
    private var colors: [UIColor] {
        return model.colors
    }
    
    private let cellIdentifier = "DefaultCell"
    
    func updateColors(completion: @escaping(() -> ())){
        self.model.updateColors {
            completion()
        }
    }
    
    func registerCells(for collectionView: UICollectionView){
          collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}

extension ColorCollectionPresenter : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.contentView.backgroundColor = colors[indexPath.row]
        cell.contentView.layer.cornerRadius = 20.0
         return cell
    }
    
    
    
}
