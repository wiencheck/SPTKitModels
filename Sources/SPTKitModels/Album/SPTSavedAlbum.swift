//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

/// Saved Album object containing reference to the full Album object.
public class SPTSavedAlbum: Codable {
    /**
     The date and time the album was saved.
     */
    public let addedDate: Date
    
    /**
     Information about the album.
     */
    public let album: SPTAlbum
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case addedDate = "added_at"
        case album
    }
}
