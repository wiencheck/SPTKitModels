//
//  Throwable.swift
//  
//
//  Created by Adam Wienconek on 15/11/2020.
//

import Foundation

/**
 Helper struct for decoding items in array to avoid decoding failures if single element fails.
 */
struct Throwable<T: Decodable>: Decodable {
    let result: Result<T, Error>

    init(from decoder: Decoder) throws {
        result = Result(catching: { try T(from: decoder) })
    }
}
