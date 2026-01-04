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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // Create a single instance of the SessionManager and keep it alive for the app's lifecycle.
    @StateObject private var sessionManager = SessionManager()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(sessionManager)
        }
    }
}
