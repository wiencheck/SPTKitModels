//
//  SPTSimplifiedPlaylist+CoreDataProperties.swift
//  SPTCoreData
//
//  Created by Adam Wienconek on 04/08/2021.
//
//

import Foundation
import CoreData


extension SPTSimplifiedPlaylist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SPTSimplifiedPlaylist> {
        return NSFetchRequest<SPTSimplifiedPlaylist>(entityName: "SPTSimplifiedPlaylist")
    }

    @NSManaged public var descriptionText: String?
    @NSManaged public var imagesData: Data
    @NSManaged public var isCollaborative: Bool
    @NSManaged public var isPublic: Bool?
    @NSManaged public var name: String
    @NSManaged public var ownerData: Data
    @NSManaged public var snapshotId: String
    @NSManaged public var total: Int

}
