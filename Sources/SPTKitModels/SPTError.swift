//
//  File.swift
//  
//
//  Created by Adam Wienconek on 19/09/2020.
//

import Foundation

public struct SPTError: Codable {
    /**
     The HTTP status code that is also returned in the response header. For further information, see https://developer.spotify.com/documentation/web-api/#response-status-codes.
     */
    public let status: Int
    
    /**
     A short description of the cause of the error.
     */
    public let message: String
}

extension SPTError: LocalizedError {
    public var errorDescription: String? {
        return message
    }
}

extension SPTError {
    static let emptyAuthorizationTokenError = SPTError(status: -1, message: "Authorization token was empty.")
    static let noDataReceivedError = SPTError(status: -1, message: "No data received.")
    static let decodingError = SPTError(status: -1, message: "Could not decode data.")
    static let badRequest = SPTError(status: -1, message: "Could not create valid request.")
}

struct SPTErrorResponse: Codable {
    let error: SPTError
}
