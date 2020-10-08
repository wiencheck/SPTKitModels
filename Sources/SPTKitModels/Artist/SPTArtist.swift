//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

/// Full Artist object.
public class SPTArtist: SPTSimplifiedArtist {
    public let genres: [String]
    
    public let images: [SPTImage]
    
    public let popularity: Int
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case genres, images, popularity
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        genres = try container.decode([String].self, forKey: .genres)
        images = try container.decode([SPTImage].self, forKey: .images)
        popularity = try container.decode(Int.self, forKey: .popularity)
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(genres, forKey: .genres)
        try container.encode(images, forKey: .images)
        try container.encode(popularity, forKey: .popularity)
        try super.encode(to: encoder)
    }
}

extension SPTArtist: Plurable {
    public static var pluralKey: String {
        return "artists"
    }
}
