//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

public class SPTBaseObject: Codable, CustomStringConvertible {
    /**
     The object type.
     */
    public let type: SPTObjectType
    
    /**
     The Spotify URI for the object.
     */
    public let uri: String
    
    /**
     The Spotify ID for the object.
     */
    public let id: String
    
    /**
     A link to the Web API endpoint providing full details of the object.
     */
    public let url: URL
    
    /**
     Known external URLs for this object.
     */
    public let externalUrls: [String: URL]
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case type, uri, id
        case url = "href"
        case externalUrls = "external_urls"
    }
    
    public var description: String {
        return """
            \(type), id: \(id)
        """
    }
}
