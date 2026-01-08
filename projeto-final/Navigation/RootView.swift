import SwiftUI

struct RootView: View {
    @EnvironmentObject var sessionManager: SessionManager

    var body: some View {
        Group {
            if sessionManager.currentUser != nil {
                // User is logged in, show the main app navigation
                AppNavigationView()
            } else {
                // User is not logged in, show the authentication flow
                AuthenticationNavigationView()
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(SessionManager())
}
