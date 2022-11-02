//
//  ContentView.swift
//  TicketAPP
//
//  Created by John Doe on 02/11/2022.
//

import SwiftUI
import RealmSwift



struct ContentView: View {
    @State private var username = ""
    
    var body: some View {
        
        NavigationView {
            if username == "" {
              LoginView(username: $username)
            } else {
                Text("Logged in")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
