//
//  TicketView.swift
//  TicketAPP
//
//  Created by John Doe on 03/11/2022.
//

import SwiftUI
import RealmSwift

struct TicketsView: View {
    
    @ObservedResults( Ticket.self, sortDescriptor: SortDescriptor( keyPath: "status", ascending: false)) var tickets
    @Environment(\.realm) var realm
     
    let username: String
    let product: String
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
//
//struct TicketView_Previews: PreviewProvider {
//    static var previews: some View {
//        TicketView()
//    }
//}
