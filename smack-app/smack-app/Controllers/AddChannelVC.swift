import UIKit

class AddChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var channelDescriptionText: UITextField!
    @IBOutlet weak var bgView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createChannelPressed(_ sender: Any) {

    }

    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    func setupView() {
        nameText.attributedPlaceholder = NSAttributedString(
            string: "name",
            attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder]
        )
        channelDescriptionText.attributedPlaceholder = NSAttributedString(
            string: "description",
            attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder]
        )

        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
}
