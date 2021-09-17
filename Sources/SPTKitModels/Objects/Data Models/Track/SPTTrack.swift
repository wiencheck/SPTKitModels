// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import GRDB

/// Full Track object.
public class SPTTrack: SPTSimplifiedTrack, SPTTrackProtocol {
    
    public let album: SPTSimplifiedAlbum
    
    public let popularity: Int
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case album, popularity
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        album = try container.decode(SPTSimplifiedAlbum.self, forKey: .album)
        popularity = try container.decode(Int.self, forKey: .popularity)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(album, forKey: .album)
        try container.encode(popularity, forKey: .popularity)
        try super.encode(to: encoder)
    }
    
    public class Columns: SPTSimplifiedTrack.Columns {
        public static let album = Column(CodingKeys.album)
        public static let popularity = Column(CodingKeys.popularity)
    }
    
    public override class var databaseTableName: String { "track" }
    
    override class var tableDefinitions: (TableDefinition) -> Void {
        { table in
            super.tableDefinitions(table)
            
            table.column(CodingKeys.album.rawValue, .blob).notNull()
            table.column(CodingKeys.popularity.rawValue, .integer).notNull()
        }
    }
    
    public override class var migration: (identifier: String, migrate: (Database) throws -> Void) {
        return ("createTracks", { db in
            try db.create(table: databaseTableName, body: tableDefinitions)
        })
    }
    
}
