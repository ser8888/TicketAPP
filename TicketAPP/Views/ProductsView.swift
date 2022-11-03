//
//  ProductsView.swift
//  TicketAPP
//
//  Created by John Doe on 02/11/2022.
//

import SwiftUI

struct ProductsView: View {
    let username: String
    
    let products = ["BMW", "Meesedes", "Audi", "VW "]
    
    var body: some View {
        List {
            if let realmUser = realmApp.currentUser {
                ForEach(products, id: \.self) { product in
                    NavigationLink(destination: TicketsView(username: username, product: product)
                        .environment(\.realmConfiguration, realmUser.flexibleSyncConfiguration())) {
                            Text(product)
                        }
                }
            }
        }
        .navigationBarTitle("Products", displayMode: .inline)
    }
}

//struct ProductsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductsView(username: username)
//    }
//}
