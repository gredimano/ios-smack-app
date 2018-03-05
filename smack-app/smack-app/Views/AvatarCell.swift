import UIKit

class AvatarCell: UICollectionViewCell {

    @IBOutlet weak var avatarImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
