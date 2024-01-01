import Foundation

class OAuth2TokenStorage {
    private let key = "bearerToken"
    
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: key)
        }
        set {
            guard let token = newValue else { return }
            UserDefaults.setValue(token, forKey: key)
        }
    }
}

