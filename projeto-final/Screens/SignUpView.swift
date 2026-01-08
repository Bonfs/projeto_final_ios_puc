import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Detalhes da conta")) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Senha", text: $password)
                    SecureField("Confirme sua senha", text: $confirmPassword)
                }
            }

            Button(action: signUp) {
                Text("Criar conta")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("Cadastro")
        .alert("Sign Up Error", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    private func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            alertMessage = "Por favor, preencha todos os campos"
            showingAlert = true
            return
        }
        
        if password != confirmPassword {
            alertMessage = "Senha não batem"
            showingAlert = true
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showingAlert = true
            } else {
                // Sign up is successful.
                print("User signed up successfully: \(authResult?.user.email ?? "N/A")")
            }
        }
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
