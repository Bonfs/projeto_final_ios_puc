//
//  SingInView.swift
//  projeto-final
//
//  Created by Matheus Bonfim on 28/12/25.
//

import FirebaseAuth
import SwiftUI

struct SignInView : View {
    @State private var email = ""
    @State private var password = ""
    @Binding var path: NavigationPath
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Text("Lembretes PUC")
            TextField("Seu Email", text: $email)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .padding()
                .border(.secondary)
            SecureField("Sua senha", text: $password, )
                .padding()
                .border(.secondary)
            Button("Entrar") {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        print(error)
                        self.alertMessage = error.localizedDescription
                        self.showingAlert = true
                    } else if let user = authResult?.user {
                        print("User signed in: \(user.email ?? "N/A")")
                        // By resetting the path, we remove the sign-in view from the
                        // navigation stack, so the user can't go back to it.
                        path = NavigationPath([NavigationRoutes.home])
                    } else {
                        self.alertMessage = "Unknown sign-in error."
                        self.showingAlert = true
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(12)
            
        }
        .padding()
        .alert("Sign In Error", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    SignInView(path: $path)
}
