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
        // This is the navigation stack for the main app, for authenticated users.
        NavigationStack(path: $path) {
            HomeView()
                .navigationDestination(for: NavigationRoutes.self) { navigationRoutes in
                    // Define destinations for routes accessible after login here.
                    // For example: case .profile: ProfileView()
                    switch navigationRoutes {
                    case .home:
                        HomeView()
                    // Fallback to home for any other routes in this stack
                    default:
                        HomeView()
                    }
                }
        }
    }
}

#Preview {
    AppNavigationView()
}
