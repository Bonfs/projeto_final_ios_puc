//
//  AuthenticationNavigationView.swift
//  projeto-final
//
//  Created by Matheus Bonfim on 03/01/26.
//

import SwiftUI

struct AuthenticationNavigationView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        // This is a separate navigation stack for the authentication flow.
        NavigationStack(path: $path) {
            SignInView(path: $path)
                .navigationDestination(for: NavigationRoutes.self) { route in
                     switch route {
                        case .signIn:
                            SignInView(path: $path)
                        case .signUp:
                            SignUpView()
                             .navigationTitle("Criar conta")
                        default:
                            SignInView(path: $path)
                     }
                }
        }
    }
}
