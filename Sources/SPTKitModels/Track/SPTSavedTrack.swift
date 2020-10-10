//
//  File.swift
//  
//
//  Created by Adam Wienconek on 20/09/2020.
//

import Foundation

/// Saved Track object containing reference to the full Track object.
public class SPTSavedTrack: Codable {
    /**
     The date and time the track was saved.
     */
    public let addedDate: Date
    
    /**
     Information about the track.
     */
    public let track: SPTTrack
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case track
        case addedDate = "added_at"
    }
}

extension SPTSavedTrack: CustomStringConvertible {
    public var description: String {
        return """
            Added at: \(addedDate)
            \(track)
        """
    }
}
