//
//  AppNavigationView.swift
//  projeto-final
//
//  Created by Matheus Bonfim on 28/12/25.
//

import FirebaseAuth
import SwiftUI

struct AppNavigationView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            // This view is shown briefly before onAppear completes.
            // A ProgressView() is also a good option here.
//            Color.clear
            HomeView()
                .navigationDestination(for: NavigationRoutes.self) { navigationRoutes in
                    switch navigationRoutes {
                    case .signIn:
                        SignInView(path: $path)
                    case .home:
                        HomeView()
                    case .signUp:
                        SignUpView()
                    // Default to sign-in as a fallback
                    default:
                        SignInView(path: $path)
                    }
                }
        }
//        .onAppear {
//            if Auth.auth().currentUser != nil {
//                // User is signed in, go to home.
////                path = NavigationPath([NavigationRoutes.home])
//                path.append(NavigationRoutes.home)
//            } else {
//                // No user is signed in, go to the sign-in screen.
//                path = NavigationPath([NavigationRoutes.signIn])
////                path.append(NavigationRoutes.signIn)
//            }
//        }
    }
}

#Preview {
    AppNavigationView()
}
