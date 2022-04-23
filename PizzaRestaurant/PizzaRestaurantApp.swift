//
//  PizzaRestaurantApp.swift
//  PizzaRestaurant
//
//  Created by Wanderson López on 23/04/22.
//

import SwiftUI

@main
struct PizzaRestaurantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
