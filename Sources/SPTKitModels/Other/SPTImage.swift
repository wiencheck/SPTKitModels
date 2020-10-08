//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

public class SPTImage: Codable {
    /**
     The image height in pixels. If unknown: 0 or not returned.
     */
    public let height: Int
    
    /**
     The image width in pixels. If unknown: 0 or not returned.
     */
    public let width: Int
    
    /**
     The source URL of the image.
     */
    public let url: URL

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        height = try container.decodeIfPresent(Int.self, forKey: .height) ?? 0
        width = try container.decodeIfPresent(Int.self, forKey: .width) ?? 0
        
        if let _url = try container.decodeIfPresent(URL.self, forKey: .url) {
            url = _url
        } else {
            let _url = try container.decode(String.self, forKey: .url)
            url = URL(string: _url)!
        }
    }
}
