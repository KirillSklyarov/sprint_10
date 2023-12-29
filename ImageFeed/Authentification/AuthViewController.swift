import UIKit

final class AuthViewController: UIViewController {
    
    @IBOutlet weak var uiButton: UIButton!
    
    private let ShowWebViewSegueIdentifier = "ShowWebView"
    
    lazy var authLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-Auth")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .ypBackground
        
        view.addSubview(authLogo)
        
        authLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            authLogo.widthAnchor.constraint(equalToConstant: 60),
            authLogo.heightAnchor.constraint(equalTo: authLogo.widthAnchor),
        ])
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
    }
}

extension AuthViewController: WebViewControllerDelegate {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        dismiss(animated: true)
    }
}

extension AuthViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ShowWebViewSegueIdentifier {
            guard
                let webViewViewController = segue.destination as? WebViewViewController
            else { fatalError("Failed to prepare for \(ShowWebViewSegueIdentifier)") }
            webViewViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}
