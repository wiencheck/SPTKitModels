//
//  File.swift
//  
//
//  Created by Adam Wienconek on 12/10/2020.
//

import Foundation

/// Playlist track object
public class SPTPlaylistTrack: Codable {
    /**
     The date and time the track was added. Note that some very old playlists may return null in this field.
     */
    public let addedDate: Date?
    
    /**
     The Spotify user who added the track. Note that some very old playlists may return null in this field.
     */
    public let addedBy: SPTPublicUser?
    
    /**
     Whether this track is a local file or not.
     */
    public let isLocal: Bool
    
    /**
     Information about the track.
     */
    public let track: SPTTrack
}
