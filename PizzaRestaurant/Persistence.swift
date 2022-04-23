//
//  Persistence.swift
//  PizzaRestaurant
//
//  Created by Wanderson López on 23/04/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    // The preview property allows us to use the CoreData
    // functionality inside previews simulators.
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Order(context: viewContext)
            newItem.status = "pending"
            newItem.id = UUID()
            newItem.tableNumber = "12"
            newItem.pizzaType = "Margherita"
            newItem.numberOfSlices = 4
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    // The container property is the heart of the PersistenceController,
    // wich performs many different operations for us in the background
    // when we store and call data. Most importantly, the container
    // allow us to access the so-called viewContext, which servers as
    // an in-memory scratchpad where objects are created, fetched,
    // updated, deleted, and saved bvack to the persistent store of the
    // device where the app runs on.
    let container: NSPersistentContainer

    // The container gets initialized within the PersistenceController's
    // init function. In this, the container property gets assigned to an
    // NSPersistentContainer instance. We need to use the name of our
    // ".xcdatamodel" file, which is "Shared" (or "PizzaRestaurante" when
    // you created a mere iOS App Project), as the "name" argument.
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PizzaRestaurant")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
