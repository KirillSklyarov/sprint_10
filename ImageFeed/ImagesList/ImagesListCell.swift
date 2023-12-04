import UIKit

final class ImagesListCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var cellDateLabel: UILabel!
    
    static let reuseIdentifier = "ImagesListCell"
}
