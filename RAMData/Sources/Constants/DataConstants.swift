//
//  DataConstants.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import Foundation

//  MARK: - Public

public enum APIError: Error {
    case InvalidURL
    case InvalidResponse
    case FailedToDecode
    case Unknown
    case Custom(error: Error)
}

//  MARK: - Private

enum Endpoint {
    private static let BaseAPIURL = "https://rickandmortyapi.com/api"
    private static let CharacterPath = "/character"
    private static let EpisodePath = "/episode"
    
    static let CharacterURL = BaseAPIURL + CharacterPath
    static let EpisodeURL = BaseAPIURL + EpisodePath
}

enum HTTPMethod: String {
    case GET
}

enum APIQueryItem: String {
    case Page = "page"
    case Name = "name"
    case Status = "status"
    case Gender = "gender"
    case Episode = "episode"
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .InvalidURL:           return "Invalid URL"
        case .InvalidResponse:      return "Unexpected Status Code"
        case .FailedToDecode:       return "Failed to Decode"
        case .Unknown:              return "Unknown Error"
        case .Custom(let error):    return error.localizedDescription
        }
    }
}
