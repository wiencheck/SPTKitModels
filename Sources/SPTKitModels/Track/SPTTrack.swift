//
//  File.swift
//  
//
//  Created by Adam Wienconek on 20/09/2020.
//

import Foundation

/// Full Track object.
public class SPTTrack: SPTSimplifiedTrack {
    /**
     The album on which the track appears
     */
    public let album: SPTSimplifiedAlbum
    
    /**
     The artists who performed the track.
     */
    public let artists: [SPTSimplifiedArtist]
    
    /**
     A list of the countries in which the track can be played, identified by their ISO 3166-1 alpha-2 code.
     */
    public let availableMarkets: [String]
    
    /**
     The disc number (usually 1 unless the album consists of more than one disc).
     */
    public let discNumber: Int
    
    /**
     The track length in milliseconds.
     */
    public let durationMs: Int
    
    /**
     Whether or not the track has explicit lyrics ( true = yes it does; false = no it does not OR unknown).
     */
    public let isExplicit: Bool
    
    /**
     Part of the response when Track Relinking is applied. If true , the track is playable in the given market. Otherwise false.
     */
    public let isPlayable: Bool
    
    /**
     Part of the response when Track Relinking is applied, and the requested track has been replaced with different track. The track in the linked_from object contains information about the originally requested track.
     */
    public let linkedFrom: SPTLinkedTrack?
    
    /**
     The popularity of the track. The value will be between 0 and 100, with 100 being the most popular.
     The popularity of a track is a value between 0 and 100, with 100 being the most popular. The popularity is calculated by algorithm and is based, in the most part, on the total number of plays the track has had and how recent those plays are.
     Generally speaking, songs that are being played a lot now will have a higher popularity than songs that were played a lot in the past. Duplicate tracks (e.g. the same track from a single and an album) are rated independently. Artist and album popularity is derived mathematically from track popularity. Note that the popularity value may lag actual popularity by a few days: the value is not updated in real time.
     */
    public let popularity: Int
    
    /**
     A link to a 30 second preview (MP3 format) of the track. Can be null
    */
    public let previewUrl: URL?
    
    /**
     The number of the track. If an album has several discs, the track number is the number on the specified disc.
     */
    public let trackNumber: Int
    
    /**
     Whether or not the track is from a local file.
     */
    public let isLocal: Bool
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case album, artists, popularity
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationMs = "duration_ms"
        case isExplicit = "is_explicit"
        case isPlayable = "is_playable"
        case linkedFrom = "linked_from"
        case previewUrl = "preview_url"
        case trackNumber = "track_number"
        case isLocal = "is_local"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        album = try container.decode(SPTSimplifiedAlbum.self, forKey: .album)
        artists = try container.decode([SPTSimplifiedArtist].self, forKey: .artists)
        popularity = try container.decode(Int.self, forKey: .popularity)
        availableMarkets = try container.decode([String].self, forKey: .availableMarkets)
        discNumber = try container.decode(Int.self, forKey: .discNumber)
        durationMs = try container.decode(Int.self, forKey: .durationMs)
        isExplicit = try container.decode(Bool.self, forKey: .isExplicit)
        isPlayable = try container.decode(Bool.self, forKey: .isPlayable)
        linkedFrom = try container.decode(SPTLinkedTrack.self, forKey: .linkedFrom)
        previewUrl = try container.decodeIfPresent(URL.self, forKey: .previewUrl)
        trackNumber = try container.decode(Int.self, forKey: .trackNumber)
        isLocal = try container.decode(Bool.self, forKey: .isLocal)
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(album, forKey: .album)
        try container.encode(artists, forKey: .artists)
        try container.encode(popularity, forKey: .popularity)
        try container.encode(availableMarkets, forKey: .availableMarkets)
        try container.encode(discNumber, forKey: .discNumber)
        try container.encode(durationMs, forKey: .durationMs)
        try container.encode(isExplicit, forKey: .isExplicit)
        try container.encode(isPlayable, forKey: .isPlayable)
        try container.encode(linkedFrom, forKey: .linkedFrom)
        try container.encodeIfPresent(previewUrl, forKey: .previewUrl)
        try container.encode(trackNumber, forKey: .trackNumber)
        try container.encode(isLocal, forKey: .isLocal)
        try super.encode(to: encoder)
    }
}
