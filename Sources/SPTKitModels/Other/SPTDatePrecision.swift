//
//  File.swift
//  
//
//  Created by Adam Wienconek on 07/10/2020.
//

import Foundation

import Foundation

public enum SPTDatePrecision: String, Codable {
    case day, month, year
    
    var dateFormat: String {
        switch self {
        case .day:
            return "yyyy-MM-dd"
        case .month:
            return "yyyy-MM"
        case .year:
            return "yyyy"
        }
    }
}
