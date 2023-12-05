import UIKit

final class ImagesListCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var cellDateLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!
    
    static let reuseIdentifier = "ImagesListCell"
}


extension ImagesListCell {
    func setGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.start.cgColor, UIColor.end.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = gradientView.layer.bounds
        gradientView.layer.insertSublayer(gradient, at: 0)
    }
}
