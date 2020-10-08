//
//  File.swift
//  
//
//  Created by Adam Wienconek on 08/10/2020.
//

/// Simplified Playlist object.
public class SPTSimplifiedPlaylist: SPTBaseObject {
    /**
     true if the owner allows other users to modify the playlist.
     */
    public let isCollaborative: Bool
    
    /**
     The playlist description. Only returned for modified, verified playlists, otherwise null .
     */
    public let playlistDescription: String?
    
    /**
     Images for the playlist. The array may be empty or contain up to three images. The images are returned by size in descending order. See Working with Playlists.
     Note: If returned, the source URL for the image ( url ) is temporary and will expire in less than a day.
     */
    public let images: [SPTImage]
    
    /**
     The name of the playlist.
     */
    public let name: String
    
    /**
     The user who owns the playlist
     */
    public let owner: SPTPublicUser
    
    /**
     The playlist’s public/private status: true the playlist is public, false the playlist is private, null the playlist status is not relevant. For more about public/private status, see [Working with Playlists](https://developer.spotify.com/documentation/general/guides/working-with-playlists/).
     */
    public let isPublic: Bool?
    
    /**
     The version identifier for the current playlist. Can be supplied in other requests to target a specific playlist version.
     */
    public let snapshotId: String
    
    /**
     Number of tracks in the playlist.
     */
    public let total: Int
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case images, name, owner, tracks
        case isCollaborative = "is_collaborative"
        case playlistDescription = "description"
        case snapshotId = "snapshot_id"
        case isPublic = "public"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        images = try container.decode([SPTImage].self, forKey: .images)
        name = try container.decode(String.self, forKey: .name)
        owner = try container.decode(SPTPublicUser.self, forKey: .owner)
        isCollaborative = try container.decode(Bool.self, forKey: .isCollaborative)
        playlistDescription = try container.decodeIfPresent(String.self, forKey: .playlistDescription)
        snapshotId = try container.decode(String.self, forKey: .snapshotId)
        isPublic = try container.decodeIfPresent(Bool.self, forKey: .isPublic)
//        if let dict = try container.decodeIfPresent([String: Any].self, forKey: .tracks),
//               let value = dict["total"] as? Int {
//            total = value
//        } else {
//            total = 0
//        }
        total = 0
        
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(images, forKey: .images)
        try container.encode(name, forKey: .name)
        try container.encode(owner, forKey: .owner)
        try container.encode(isCollaborative, forKey: .isCollaborative)
        try container.encode(playlistDescription, forKey: .playlistDescription)
        try container.encode(snapshotId, forKey: .snapshotId)
        try container.encode(isPublic, forKey: .isPublic)
        
        try super.encode(to: encoder)
    }
}
