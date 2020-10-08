//
//  File.swift
//  
//
//  Created by Adam Wienconek on 20/09/2020.
//

/// Private User object.
public class SPTPrivateUser: SPTPublicUser {
    /**
     The country of the user, as set in the user’s account profile. An ISO 3166-1 alpha-2 country code. This field is only available when the current user has granted access to the user-read-private scope.
     */
    public let country: String
    
    /**
     The user’s email address, as entered by the user when creating their account. Important! This email address is unverified; there is no proof that it actually belongs to the user. This field is only available when the current user has granted access to the user-read-email scope.
     */
    public let email: String

    /**
     The user’s Spotify subscription level: “premium”, “free”, etc. (The subscription level “open” can be considered the same as “free”.) This field is only available when the current user has granted access to the user-read-private scope.
     */
    public let product: String

    // MARK: Codable stuff
    private enum CodingKeys: String, CodingKey {
        case country, email, product
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        country = try container.decode(String.self, forKey: .country)
        email = try container.decode(String.self, forKey: .email)
        product = try container.decode(String.self, forKey: .product)
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(country, forKey: .country)
        try container.encode(email, forKey: .email)
        try container.encode(product, forKey: .product)
        try super.encode(to: encoder)
    }
}
