

import UIKit
import GameplayKit

struct ColorModel {
    typealias  UpdateColorsCmpl = () -> ()
    var colors: [UIColor] = []
    
    mutating func updateColors(completion:@escaping UpdateColorsCmpl){
        let random = GKRandomSource.sharedRandom()
        self.colors = random.arrayByShufflingObjects(in: colorStorage) as! [UIColor]
        completion()
    }
    
    private let colorStorage : [UIColor] = [
        .appleRed,
        .appleOrange,
        .appleGreen,
        .appleBlue,
        .appleTeal,
        .applePurple
    ]
    
}
