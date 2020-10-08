//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

public class SPTPagingObject<T: Codable>: Codable {
    /**
     The requested data.
     */
    public let items: [T]
    
    /**
     The maximum number of items in the response (as set in the query or by default).
     */
    public let limit: Int
    
    /**
     URL to the next page of items.
     */
    public let next: URL?
    
    public let offset: Int
    
    public let previous: URL?
    
    public let total: Int
}
