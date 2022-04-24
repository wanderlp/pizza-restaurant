//
//  ContentView.swift
//  PizzaRestaurant
//
//  Created by Wanderson López on 23/04/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Order.entity(), sortDescriptors: [], predicate: NSPredicate(format: "status != %@", Status.completed.rawValue))
    var orders: FetchedResults<Order>
    
    @State var showOrderSheet = false
    
    var body: some View {
        NavigationView {
            List {
                Text("Sample Order")
            }
            .navigationTitle("My Orders")
            .navigationBarItems(
                trailing: Button(
                    action: {
                        showOrderSheet = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                    }
                )
            )
            .sheet(isPresented: $showOrderSheet) {
                OrderSheetView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
