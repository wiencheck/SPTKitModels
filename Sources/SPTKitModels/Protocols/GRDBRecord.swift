//
//  File.swift
//  
//
//  Created by Adam Wienconek on 09/08/2021.
//

import GRDB

public protocol GRDBRecord: FetchableRecord & PersistableRecord {
    static var migration: (identifier: String, migrate: (Database) throws -> Void) { get }
}
