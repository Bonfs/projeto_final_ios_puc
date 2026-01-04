//
//  projeto_finalApp.swift
//  projeto-final
//
//  Created by Matheus Bonfim on 28/12/25.
//

import FirebaseAuth
import SwiftUI

@main
struct projeto_finalApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var path = NavigationPath()
    

    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser != nil {
                AppNavigationView()
            } else {
                NavigationStack(path: $path) {
                    SignInView(path: $path)
                }
            }
        }
        
    }
}
