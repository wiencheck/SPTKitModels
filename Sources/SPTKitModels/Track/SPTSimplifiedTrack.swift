//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

/// Simplified Track object.
public class SPTSimplifiedTrack: SPTBaseObject {
    /**
     The name of this track.
     */
    public let name: String
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try super.encode(to: encoder)
    }
}
