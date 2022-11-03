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
    //для ожмдания пока идет подписка
    @State private var busy = false
    @State private var title = ""
    @State private var details = ""
    
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(tickets) { ticket in
                        Text(ticket.title)
                    }
                }
                Spacer()
                VStack {
                    TextField("Title", text: $title)
                    TextField("Details", text: $details)
                        .font(.caption)
                    Button (
                        "Add ticket"
                    ) {
                        addTicket()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(title.isEmpty || busy)

                }
            }
            .padding()
            if busy {
                ProgressView()
            }
        }
        .onAppear(perform: subsribe)
        .onDisappear(perform: unsubsribe)
        .navigationBarTitle(product, displayMode: .inline)
    }
    
    private func addTicket() {
        let ticket = Ticket(product: product, title: title, details: details.isEmpty ? nil : details, author: username)
  // this line write to Atlas, we are already subscribed.
        $tickets.append(ticket)
        title = ""
        details = ""
    }
    
    private func subsribe() {
        let lastYear = Date(timeIntervalSinceReferenceDate: Date().timeIntervalSinceReferenceDate.rounded() - (60 * 60 * 24 * 365))
        let subsriptions = realm.subscriptions
        if subsriptions.first(named: product) == nil {
            busy = true
            subsriptions.update {
                subsriptions.append(QuerySubscription<Ticket>(name: product) { ticket in
                    return ticket.product == product && ( ticket.status != .complete || ticket.created > lastYear )
                })
            } onComplete: { error in
                if let error = error  {
                    print("Failed to subscribe for \(product): \(error.localizedDescription)")
                }
                busy = false
            }
        }
    }
    
    private func unsubsribe() {
        let subscriptions = realm.subscriptions
        subscriptions.update {
            subscriptions.remove(named: product)
        } onComplete: { error in
            if let error = error {
                print("Failed to unsubscribe for \(product): \(error.localizedDescription)")
            }
        }
    }
}
//
//struct TicketView_Previews: PreviewProvider {
//    static var previews: some View {
//        TicketView()
//    }
//}
