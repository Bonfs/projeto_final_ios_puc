//
//  HomeView.swift
//  projeto-final
//
//  Created by Matheus Bonfim on 02/01/26.
//

import FirebaseAuth
import SwiftUI

struct HomeView : View {
    var body: some View {
        Text("Home")
        Button("Sair") {
            do {
                try Auth.auth().signOut()
            } catch {
                print("deu ruim!!!")
            }
        }
    }
}

#Preview {
    HomeView()
}
