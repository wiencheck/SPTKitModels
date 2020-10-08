//
//  PlurableRoot.swift
//  
//
//  Created by Adam Wienconek on 07/10/2020.
//

import Foundation

public protocol Plurable: Decodable {
    static var pluralKey: String { get }
}

public class PlurableRoot<T>: Decodable where T: Plurable {
    let items: [T]

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
        items = try container.decode([T].self, forKey: codingKey)
    }
}
