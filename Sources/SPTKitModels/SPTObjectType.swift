//
//  File.swift
//  
//
//  Created by Adam Wienconek on 09/10/2020.
//

import Foundation

public enum SPTObjectType: String, Codable, CaseIterable {
    case album, artist, playlist, track, show, episode, user
    
    public static var searchTypes: [SPTObjectType] {
        return [.album, .artist, .playlist, .track, .show, .episode]
    }
    
    public var pluralKey: String {
        switch self {
        case .album:    return "albums"
        case .artist:    return "artists"
        case .playlist:    return "playlists"
        case .track:    return "tracks"
        case .show:    return "shows"
        case .episode:    return "episodes"
        case .user:    return "users"
        }
    }
}
