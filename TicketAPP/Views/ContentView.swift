//
//  ContentView.swift
//  TicketAPP
//
//  Created by John Doe on 02/11/2022.
//

import SwiftUI
//import RealmSwift



struct ContentView: View {
    @State private var username = ""
    
    var body: some View {
        
        NavigationView {
            if username == "" {
              LoginView(username: $username)
            } else {
                ProductsView(username: username)
                   .navigationBarItems(trailing: LogoutButton( username: $username))
//                    .navigationBarItems(trailing: LogoutButton(username: $username))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
