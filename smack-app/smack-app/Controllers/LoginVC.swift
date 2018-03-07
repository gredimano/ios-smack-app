import UIKit

class LoginVC: UIViewController {

    // Outlets
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func CreateAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()

        guard let email = userNameText.text, userNameText.text != "" else { return }
        guard let pass = passwordText.text, passwordText.text != "" else { return }

        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    } else {

                    }
                })
            } else {

            }
        }
    }

    func setupView() {
        spinner.isHidden = true
        userNameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
    }
}
