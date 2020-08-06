//
//  Country+CoreDataProperties.swift
//  
//
//  Created by Syft on 04/03/2020.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var capital: String?
    // Should have a name otherwise there is no context for user
    @NSManaged public var name: String
    @NSManaged public var population: Int32

}
