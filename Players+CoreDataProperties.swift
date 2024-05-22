//
//  Players+CoreDataProperties.swift
//  Oceny
//
//  Created by Paweł on 22/05/2024.
//
//

import Foundation
import CoreData


extension Players {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Players> {
        return NSFetchRequest<Players>(entityName: "Players")
    }

    @NSManaged public var name: String?
    @NSManaged public var game: String?
    @NSManaged public var rating: Int64

}

extension Players : Identifiable {

}
