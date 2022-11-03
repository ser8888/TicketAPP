//
//  TicketView.swift
//  TicketAPP
//
//  Created by John Doe on 03/11/2022.
//

import SwiftUI
import RealmSwift

struct TicketView: View {
    @ObservedRealmObject var ticket: Ticket
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(ticket.title)
                    .font(.headline)
                    .foregroundColor(ticket.color)
                Spacer()
                DateView(date: ticket.created)
                    .font(.caption)
            }
            Text(ticket.author)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(ticket.details ?? "No details")
                .font(.caption)
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            if ticket.status == .inProgress {
                Button(action: { $ticket.status.wrappedValue = .notStarted }) {
                    Label("Not Started", systemImage: "stop.circle.fill")
                }
                .tint(.red)
            }
            if ticket.status == .complete {
                Button(action: { $ticket.status.wrappedValue = .inProgress }) {
                    Label("In Progress", systemImage: "bolt.circle.fill")
                }
                .tint(.yellow)
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            if ticket.status == .inProgress {
                Button(action: { $ticket.status.wrappedValue = .complete }) {
                    Label("Complete", systemImage: "checkmark.circle.fill")
                }
                .tint(.green)
            }
            if ticket.status == .notStarted {
                Button(action: { $ticket.status.wrappedValue = .inProgress }) {
                    Label("In Progress", systemImage: "bolt.circle.fill")
                }
                .tint(.yellow)
            }
        }
    }
}
    struct TicketView_Previews: PreviewProvider {
        static var previews: some View {
            
            let ticket1 = Ticket(product: "Realm", title: "Ticket 1", details: "This is a big deal", author: "Andrew", created: Date(timeIntervalSinceReferenceDate: Date().timeIntervalSinceReferenceDate - 1000000), status: .notStarted)
            
            let ticket2 = Ticket(product: "Realm", title: "My second issue", details: "Всякие пустяки короче ", author: "Бузова", created: Date(timeIntervalSinceReferenceDate: Date().timeIntervalSinceReferenceDate - 1000000), status: .inProgress)
            
            let ticket3 = Ticket(product: "Realm", title: "Issue three", details: "This is not such a big deal. But I do want to talk about it at greate length. This is not such a big deal. But I do want to talk about it at greate length.", author: "Jane", status: .complete)
            
            return NavigationView {
                List {
                    TicketView(ticket: ticket1)
                    TicketView(ticket: ticket2)
                    TicketView(ticket: ticket3)
                }
            }
        }
    }
    

