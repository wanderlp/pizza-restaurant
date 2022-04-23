//
//  ContentView.swift
//  PizzaRestaurant
//
//  Created by Wanderson López on 23/04/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Sample Order")
            }
            .navigationTitle("My Orders")
            .navigationBarItems(
                trailing: Button(
                    action: {
                        print("Open order sheet")
                    }, label: {
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                    }
                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
