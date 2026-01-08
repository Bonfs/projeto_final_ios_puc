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
                    switch navigationRoutes {
                    case .home:
                        HomeView()
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
