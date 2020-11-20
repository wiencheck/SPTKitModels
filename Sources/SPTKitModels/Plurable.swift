//
//  Nested.swift
//  
//
//  Created by Adam Wienconek on 07/10/2020.
//

import Foundation

public protocol Nestable: Decodable {
    static var pluralKey: String { get }
}

public class Nested<T>: Decodable where T: Nestable {
    public let items: [T]

    private struct CodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        guard let codingKey = CodingKeys(stringValue: T.pluralKey) else {
            throw SPTError(status: -1, message: "Couldn't create valid CodingKey")
        }
        let throwables = try container.decode([Throwable<T>].self, forKey: codingKey)
        items = throwables.compactMap {
            try? $0.result.get()
        }
    }
}
