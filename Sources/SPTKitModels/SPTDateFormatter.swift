//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

final class SPTDateFormatter {
    static let shared = SPTDateFormatter()
    
    private let formatter = DateFormatter()
    
    func date(from dateString: String, precision: SPTDatePrecision) -> Date {
        formatter.dateFormat = precision.dateFormat
        return formatter.date(from: dateString)!
    }
}
