//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

/// Full Artist object.
public class SPTArtist: SPTSimplifiedArtist {
    /**
     Information about the followers of the artist.
     */
    public let followers: SPTFollowers
    
    /**
     A list of the genres the artist is associated with. For example: "Prog Rock" , "Post-Grunge". (If not yet classified, the array is empty.)
     */
    public let genres: [String]
    
    /**
     Images of the artist in various sizes, widest first.
     */
    public let images: [SPTImage]
    
    /**
     The popularity of the artist. The value will be between 0 and 100, with 100 being the most popular. The artist’s popularity is calculated from the popularity of all the artist’s tracks.
     */
    public let popularity: Int
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case followers, genres, images, popularity
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        followers = try container.decode(SPTFollowers.self, forKey: .followers)
        genres = try container.decode([String].self, forKey: .genres)
        images = try container.decode([SPTImage].self, forKey: .images)
        popularity = try container.decode(Int.self, forKey: .popularity)
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(followers, forKey: .followers)
        try container.encode(genres, forKey: .genres)
        try container.encode(images, forKey: .images)
        try container.encode(popularity, forKey: .popularity)
        try super.encode(to: encoder)
    }
}

/*
 Sample response
 
 {
   "external_urls" : {
     "spotify" : "https://open.spotify.com/artist/0OdUWJ0sBjDrqHygGUXeCF"
   },
   "followers" : {
     "href" : null,
     "total" : 306565
   },
   "genres" : [ "indie folk", "indie pop" ],
   "href" : "https://api.spotify.com/v1/artists/0OdUWJ0sBjDrqHygGUXeCF",
   "id" : "0OdUWJ0sBjDrqHygGUXeCF",
   "images" : [ {
     "height" : 816,
     "url" : "https://i.scdn.co/image/eb266625dab075341e8c4378a177a27370f91903",
     "width" : 1000
   }, {
     "height" : 522,
     "url" : "https://i.scdn.co/image/2f91c3cace3c5a6a48f3d0e2fd21364d4911b332",
     "width" : 640
   }, {
     "height" : 163,
     "url" : "https://i.scdn.co/image/2efc93d7ee88435116093274980f04ebceb7b527",
     "width" : 200
   }, {
     "height" : 52,
     "url" : "https://i.scdn.co/image/4f25297750dfa4051195c36809a9049f6b841a23",
     "width" : 64
   } ],
   "name" : "Band of Horses",
   "popularity" : 59,
   "type" : "artist",
   "uri" : "spotify:artist:0OdUWJ0sBjDrqHygGUXeCF"
 }
 
 */
