//
//  SPTBaseObject+CoreDataClass.swift
//  SPTCoreData
//
//  Created by Adam Wienconek on 04/08/2021.
//
//

import Foundation
import CoreData

extension CodingUserInfoKey {
  static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

protocol SPTDecodable: Decodable {
    func setValues(fromDecoder decoder: Decoder)
}

@objc(SPTBaseObject)
public class SPTBaseObject: NSManagedObject, SPTBaseObjectProtocol {
    
    private(set) public var type: SPTObjectType {
        get {
            SPTObjectType(rawValue: typeValue)!
        } set {
            typeValue = newValue.rawValue
        }
    }
    
    private(set) public var externalURLs: [String: URL] {
        get {
            externalURLsData.decoded() ?? [:]
        } set {
            externalURLsData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
    
    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case type, uri, id
        case url = "href"
        case externalURLs = "external_urls"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          throw DecoderConfigurationError.missingManagedObjectContext
        }
        self.init(context: context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(SPTObjectType.self, forKey: .type)
        uri = try container.decode(String.self, forKey: .uri)
        url = try container.decode(URL.self, forKey: .url)
        id = try container.decode(String.self, forKey: .id)
        externalURLs = try container.decode([String: URL].self, forKey: .externalURLs)
    }
    
    public override var description: String {
        return """
            \(type), id: \(id)
        """
    }
    
}
