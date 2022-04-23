//
//  OrderSheetView.swift
//  PizzaRestaurant
//
//  Created by Wanderson López on 23/04/22.
//

import SwiftUI

struct OrderSheetView: View {
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
                    print("Save de order!")
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
    }
}
