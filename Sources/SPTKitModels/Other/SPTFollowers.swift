//
//  File.swift
//  
//
//  Created by Adam Wienconek on 20/09/2020.
//

import Foundation

import Foundation

public class SPTFollowers: Codable {
    /**
     A link to the Web API endpoint providing full details of the followers; null if not available. Please note that this will always be set to null, as the Web API does not support it at the moment.
     */
    public let url: URL?
    
    /**
     The total number of followers.
     */
    public let count: Int
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case url = "href"
        case count = "total"
    }
}
