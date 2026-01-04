//
//  AppDelegate.swift
//  projeto-final
//
//  Created by Matheus Bonfim on 02/01/26.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()

    #if DEBUG
    // For the iOS Simulator, "127.0.0.1" is correct.
    // For a physical device, replace "127.0.0.1" with your computer's local IP address.
    print("Connecting to Firebase Auth Emulator")
    Auth.auth().useEmulator(withHost:"127.0.0.1", port:9099)
    #endif

    return true
  }
}
