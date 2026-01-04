import Foundation
import Combine
import FirebaseAuth

class SessionManager: ObservableObject {
    @Published var currentUser: User?
    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            // This closure is called whenever the auth state changes.
            // We update the currentUser property, which will cause any
            // views observing this object to re-render.
            self?.currentUser = user
        }
    }

    deinit {
        if let handler = handler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
}
