//
//  LoginView.swift
//  TicketAPP
//
//  Created by John Doe on 02/11/2022.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var username: String
    
    var body: some View {
        ProgressView()
            .task {
                await login()
            }
    }

private func login() async {
    do {
        let user = try await realmApp.login(credentials: .anonymous)
        username = user.id
    } catch {
        print("Failed to login to Realm: \(error.localizedDescription)")
    }
}
        }
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(username: @username )
//    }
//}
