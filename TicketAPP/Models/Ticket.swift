//
//  Ticket.swift
//  TicketAPP
//
//  Created by John Doe on 03/11/2022.
//

import SwiftUI
import RealmSwift

class Ticket: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var product: String
    @Persisted var title: String
    @Persisted var details: String?
    @Persisted var author: String
    @Persisted var created = Date()
    @Persisted var status = TicketStatus.notStarted
    var color: Color {
        switch status {
        case .notStarted:
            return .red
        case .inProgress:
            return .yellow
        case .complete:
            return .green
        }
    }
    enum TicketStatus: String, PersistableEnum {
        case notStarted, inProgress, complete
    }
    
    
    
    
}
