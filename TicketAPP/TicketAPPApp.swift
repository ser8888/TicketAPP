//
//  TicketAPPApp.swift
//  TicketAPP
//
//  Created by John Doe on 02/11/2022.
//

import SwiftUI
import RealmSwift

//connect with Realm container

let realmApp = RealmSwift.App(id: "appfromvideo-lkgda")

@main
struct TicketAPPApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
