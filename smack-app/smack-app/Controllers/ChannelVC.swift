import UIKit

class ChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) { }
    @IBOutlet weak var profileImage: CircleImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(ChannelVC.userDataDidChange(_:)),
            name: NOTIF_USER_DATA_DID_CHANGE,
            object: nil
        )
    }

    override func viewDidAppear(_ animated: Bool) {
        setUpUserInfo()
    }

    @objc func userDataDidChange(_ notif: Notification) {
        setUpUserInfo()
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }

    func setUpUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            profileImage.image = UIImage(named: UserDataService.instance.avatarName)
            profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            profileImage.image = UIImage(named: "menuProfileIcon")
            profileImage.backgroundColor = UIColor.lightGray
        }
    }
}
