//
//  OrderSheetView.swift
//  PizzaRestaurant
//
//  Created by Wanderson López on 23/04/22.
//

import SwiftUI

struct OrderSheetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let pizzaTypes = ["Pizza Marghetita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]

    @State var selectedPizzaIndex = 1
    @State var numberOfSlices = 1
    @State var tableNumber = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pizza Details")) {
                    Picker(selection: $selectedPizzaIndex, label: Text("Pizza Type")) {
                        ForEach(0 ..< pizzaTypes.count) {
                            Text(self.pizzaTypes[$0]).tag($0)
                        }
                    }
                    
                    Stepper("\(numberOfSlices) Slices", value: $numberOfSlices, in: 1...12)
                }
                
                Section(header: Text("Table"))
                {
                    TextField("Table Number", text: $tableNumber)
                        .keyboardType(.numberPad)
                }
                
                Button(action: {
                    guard self.tableNumber != "" else { return }
                    let newOrder = Order(context: viewContext)
                    newOrder.pizzaType = self.pizzaTypes[self.selectedPizzaIndex]
                    newOrder.orderStatus = .pending
                    newOrder.tableNumber = self.tableNumber
                    newOrder.numberOfSlices = Int16(self.numberOfSlices)
                    newOrder.id = UUID()
                    
                    do {
                        try viewContext.save()
                        print("Order saved.")
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Add Order")
                }
            }
            .navigationTitle("Add Order")
        }
    }
}

struct OrderSheetView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSheetView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
