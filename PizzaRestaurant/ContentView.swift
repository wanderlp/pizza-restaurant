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
                ForEach(orders) { order in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(order.pizzaType) - \(order.numberOfSlices) slices")
                                .font(.headline)
                            Text("Table \(order.tableNumber)")
                                .font(.subheadline)
                        }
                        Spacer()
                        Button(action: {
                            print("Update order")
                        }) {
                            Text(order.orderStatus == .pending ? "Prepare" : "Complete")
                                .foregroundColor(.blue)
                        }
                    }
                    .frame(height: 50)
                }
            }
            .listStyle(PlainListStyle())
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
