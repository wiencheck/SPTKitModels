//
//  File.swift
//  
//
//  Created by Adam Wienconek on 08/10/2020.
//

import Foundation

/// Full Playlist object.
public class SPTPlaylist: SPTSimplifiedPlaylist {
    /**
     Information about the followers of the playlist.
     */
    public let followers: SPTFollowers
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case followers
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        followers = try container.decode(SPTFollowers.self, forKey: .followers)
        
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(followers, forKey: .followers)
        
        try super.encode(to: encoder)
    }
}
