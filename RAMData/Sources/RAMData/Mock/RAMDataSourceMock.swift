//
//  RAMDataSourceMock.swift
//
//
//  Created by Mario Corte on 2/20/25.
//

import Foundation
import Combine

public struct RAMDataSourceMock: RAMDataSource {
    public init() { }
}

// MARK: Async/Await
extension RAMDataSourceMock {
    public func getCharactersAsync(for page: Int, name: String?, status: String?, gender: String?) async throws -> Characters {
        try getMockResult(Characters.self, for: page > 0 ? "CharactersMock" : "ErrorMock")
    }
    
    public func getEpisodesAsync(for page: Int) async throws -> Episodes {
        try getMockResult(Episodes.self, for: page > 0 ? "EpisodesMock" : "ErrorMock")
    }
    
    public func getEpisodesAsync(_ episodes: [Int]) async throws -> [Episode] {
        try getMockResult([Episode].self, for: !episodes.isEmpty ? "CharacterEpisodesMock" : "ErrorMock")
    }
}

// MARK: Combine
extension RAMDataSourceMock {
    public func getCharacters(for page: Int, name: String?, status: String?, gender: String?) -> AnyPublisher<Characters, APIError> {
        return Fail(error: APIError.Unknown)
            .eraseToAnyPublisher()
    }
    
    public func getEpisodes(for page: Int) -> AnyPublisher<Episodes, APIError> {
        return Fail(error: APIError.Unknown)
            .eraseToAnyPublisher()
    }
    
    public func getEpisodes(_ episodes: [Int]) -> AnyPublisher<[Episode], APIError> {
        return Fail(error: APIError.Unknown)
            .eraseToAnyPublisher()
    }
}

// MARK: Callback
extension RAMDataSourceMock {
    public func getCharacters(for page: Int, name: String?, status: String?, gender: String?, completion: @escaping (Result<Characters, APIError>) -> Void) {
        completion(.failure(APIError.Unknown))
    }
    
    public func getEpisodes(for page: Int, completion: @escaping (Result<Episodes, APIError>) -> Void) {
        completion(.failure(APIError.Unknown))
    }
    
    public func getEpisodes(_ episodes: [Int], completion: @escaping (Result<[Episode], APIError>) -> Void) {
        completion(.failure(APIError.Unknown))
    }
}

// MARK: Private
private extension RAMDataSourceMock {
    func getMockResult<T: Decodable>(_ type: T.Type, for resource: String) throws -> T {
        guard let filepath = Bundle.module.path(forResource: resource, ofType: "json") else {
            throw APIError.InvalidFilePath
        }
        guard let json = try String(contentsOfFile: filepath).data(using: .utf8) else {
            throw APIError.InvalidResponse
        }
        do {
            return try JSONDecoder().decode(type, from: json)
        } catch {
            throw APIError.FailedToDecode
        }
    }
}
