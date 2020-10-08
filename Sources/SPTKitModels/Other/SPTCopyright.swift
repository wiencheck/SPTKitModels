//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

public class SPTCopyright: Codable {
    /**
     The copyright text for this object.
     */
    public let text: String
    
    /**
     The type of copyright: C = the copyright, P = the sound recording (performance) copyright.
     */
    public let type: String
}
