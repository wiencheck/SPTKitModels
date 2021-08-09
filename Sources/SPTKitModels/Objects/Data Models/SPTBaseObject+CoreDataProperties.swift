//
//  SPTBaseObject+CoreDataProperties.swift
//  SPTCoreData
//
//  Created by Adam Wienconek on 04/08/2021.
//
//

import Foundation
import CoreData

extension SPTBaseObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SPTBaseObject> {
        return NSFetchRequest<SPTBaseObject>(entityName: "SPTBaseObject")
    }

    @NSManaged var externalURLsData: Data
    @NSManaged public var id: String
    @NSManaged var typeValue: String
    @NSManaged public var uri: String
    @NSManaged public var url: URL
}

extension SPTBaseObject : Identifiable {

}
