//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

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
    
    /**
     The precision with which release_date value is known: "year" , "month" , or "day".
     */
    public let releaseDatePrecision: SPTDatePrecision
    
    /**
     The date the album was first released.
     */
    public let releaseDate: Date
    
    public override var description: String {
        return """
           Album: \"\(name)\", artists: \(artists), uri: \(uri)
        """
    }
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case artists, images, name
        case albumGroup = "album_group"
        case albumType = "album_type"
        case availableMarkets = "available_markets"
        case releaseDatePrecision = "release_date_precision"
        case releaseDate = "release_date"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        albumGroup = try container.decodeIfPresent(AlbumGroup.self, forKey: .albumGroup)
        albumType = try container.decodeIfPresent(AlbumType.self, forKey: .albumType) ?? .album
        artists = try container.decode([SPTSimplifiedArtist].self, forKey: .artists)
        availableMarkets = try container.decodeIfPresent([String].self, forKey: .availableMarkets) ?? []
        images = try container.decode([SPTImage].self, forKey: .images)
        name = try container.decode(String.self, forKey: .name)
        releaseDatePrecision = try container.decode(SPTDatePrecision.self, forKey: .releaseDatePrecision)

        let dateString = try container.decode(String.self, forKey: .releaseDate)
        releaseDate = SPTDateFormatter.shared.date(from: dateString, precision: releaseDatePrecision)
        try super.init(from: decoder)
    }
    
    public required init() {
        fatalError("SPTKit objects should not be created directly.")
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(albumGroup, forKey: .albumGroup)
        try container.encode(albumType, forKey: .albumType)
        try container.encode(artists, forKey: .artists)
        try container.encode(availableMarkets, forKey: .availableMarkets)
        try container.encode(images, forKey: .images)
        try container.encode(name, forKey: .name)
        try container.encode(releaseDatePrecision, forKey: .releaseDatePrecision)
        try container.encode(releaseDate, forKey: .releaseDate)
        try super.encode(to: encoder)
    }
}

extension SPTSimplifiedAlbum: Nestable {
    public static var pluralKey: String {
        return "albums"
    }
}

public extension SPTSimplifiedAlbum {
    enum AlbumType: String, Codable {
        case album, single, compilation
    }
    
    enum AlbumGroup: String, CaseIterable, Codable {
        case album, single, compilation
        case appearsOn = "appears_on"
    }
}
