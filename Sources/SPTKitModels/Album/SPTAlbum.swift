//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

/// Full Album object.
public class SPTAlbum: SPTSimplifiedAlbum {
    /**
     The copyright statements of the album.
     */
    public let copyrights: [SPTCopyright]
    
    /**
     A list of the genres used to classify the album. For example: "Prog Rock" , "Post-Grunge". (If not yet classified, the array is empty.)
     */
    public let genres: [String]
    
    /**
     The label for the album.
     */
    public let label: String
    
    /**
     The popularity of the album. The value will be between 0 and 100, with 100 being the most popular. The popularity is calculated from the popularity of the album’s individual tracks.
     */
    public let popularity: Int
    
    /**
     The tracks of the album.
     */
    public let tracks: SPTPagingObject<SPTSimplifiedTrack>
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case copyrights, genres, label, popularity, tracks
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        copyrights = try container.decode([SPTCopyright].self, forKey: .copyrights)
        genres = try container.decode([String].self, forKey: .genres)
        label = try container.decode(String.self, forKey: .label)
        popularity = try container.decode(Int.self, forKey: .popularity)
        tracks = try container.decode(SPTPagingObject<SPTSimplifiedTrack>.self, forKey: .tracks)
        
        try super.init(from: decoder)
    }
    
    public required init() {
        fatalError("SPTKit objects should not be created directly.")
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(copyrights, forKey: .copyrights)
        try container.encode(genres, forKey: .genres)
        try container.encode(label, forKey: .label)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(tracks, forKey: .tracks)
        
        try super.encode(to: encoder)
    }
}
