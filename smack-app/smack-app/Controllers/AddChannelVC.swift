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
        guard let channelName = nameText.text, nameText.text != "" else { return }
        guard let channelDescription = channelDescriptionText.text else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
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
