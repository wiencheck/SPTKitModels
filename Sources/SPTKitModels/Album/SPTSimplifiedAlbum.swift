//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

/// Simplified Album object.
public class SPTSimplifiedAlbum: SPTBaseObject {
    
    /**
     The name of this album.
     */
    public let name: String
    
    /**
     The field is present when getting an artist’s albums. Possible values are “album”, “single”, “compilation”, “appears_on”. Compare to album_type this field represents relationship between the artist and the album.
     */
    public let albumGroup: AlbumGroup?
    
    /**
     The type of the album: one of “album”, “single”, or “compilation”.
     */
    public let albumType: AlbumType
    
    /**
     The artists of the album. Each artist object includes a link in href to more detailed information about the artist.
     */
    public let artists: [SPTSimplifiedArtist]
        
    /**
     The markets in which the album is available: ISO 3166-1 alpha-2 country codes. Note that an album is considered available in a market when at least 1 of its tracks is available in that market.
     */
    public let availableMarkets: [String]
    
    /**
     The cover art for the album in various sizes, widest first.
     */
    public let images: [SPTImage]
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case artists, images, name
        case albumGroup = "album_group"
        case albumType = "album_type"
        case availableMarkets = "available_markets"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        albumGroup = try container.decodeIfPresent(AlbumGroup.self, forKey: .albumGroup)
        albumType = try container.decode(AlbumType.self, forKey: .albumType)
        artists = try container.decode([SPTSimplifiedArtist].self, forKey: .artists)
        availableMarkets = try container.decode([String].self, forKey: .availableMarkets)
        images = try container.decode([SPTImage].self, forKey: .images)
        name = try container.decode(String.self, forKey: .name)
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(albumGroup, forKey: .albumGroup)
        try container.encode(albumType, forKey: .albumType)
        try container.encode(artists, forKey: .artists)
        try container.encode(availableMarkets, forKey: .availableMarkets)
        try container.encode(images, forKey: .images)
        try container.encode(name, forKey: .name)
        try super.encode(to: encoder)
    }
    
}

public extension SPTSimplifiedAlbum {
    enum AlbumType: String, Codable {
        case album, single, compilation
    }
    
    enum AlbumGroup: String, Codable {
        case album, single, compilation
        case appearsOn = "appears_on"
    }
}
