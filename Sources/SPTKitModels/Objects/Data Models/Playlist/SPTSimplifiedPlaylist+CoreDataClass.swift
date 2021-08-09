//
//  SPTSimplifiedPlaylist+CoreDataClass.swift
//  SPTCoreData
//
//  Created by Adam Wienconek on 04/08/2021.
//
//

import Foundation
import CoreData

@objc(SPTSimplifiedPlaylist)
public class SPTSimplifiedPlaylist: SPTBaseObject, SPTSimplifiedPlaylistProtocol {
    public var owner: SPTPublicUser {
        get {
            ownerData.encoded()
        } set {
            ownerData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }

    public var images: [SPTImage] {
        get {
            imagesData.decoded() ?? []
        } set {
            imagesData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
    
}
