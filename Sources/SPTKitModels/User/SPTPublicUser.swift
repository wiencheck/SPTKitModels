//
//  File.swift
//  
//
//  Created by Adam Wienconek on 20/09/2020.
//

import Foundation

/// Public User object.
public class SPTPublicUser: SPTBaseObject {
    /**
     The name displayed on the user’s profile. null if not available.
     */
    public let displayName: String?
        
    /**
     Information about the followers of this user.
     */
    public let followers: SPTFollowers?
    
    /**
     The user’s profile image.
     */
    public let images: [SPTImage]?
        
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case followers, images
        case displayName = "display_name"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        followers = try container.decodeIfPresent(SPTFollowers.self, forKey: .followers)
        images = try container.decodeIfPresent([SPTImage].self, forKey: .images)
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(followers, forKey: .followers)
        try container.encodeIfPresent(images, forKey: .images)
        try super.encode(to: encoder)
    }
}
