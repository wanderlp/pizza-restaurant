//
//  Order+CoreDataProperties.swift
//  PizzaRestaurant
//
//  Created by Wanderson López on 23/04/22.
//
//

import Foundation
import CoreData


extension Order: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var id: UUID
    @NSManaged public var pizzaType: String
    @NSManaged public var tableNumber: String
    @NSManaged public var status: String
    @NSManaged public var numberOfSlices: Int16

}

extension Order : Identifiable {

}
