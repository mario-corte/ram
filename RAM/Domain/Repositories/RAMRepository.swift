//
//  RAMRepository.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import Combine
import RAMData

protocol RAMRespository {
    // Combine
    func getCharacters(for page: Int, name: String?, status: String?, gender: String?) -> AnyPublisher<CharactersModel, APIError>
    func getEpisodes(for page: Int) -> AnyPublisher<EpisodesModel, APIError>
    func getEpisodes(_ episodes: [Int]) -> AnyPublisher<[EpisodeModel], APIError>
    
    // Async/Await
    func getCharactersAsync(for page: Int, name: String?, status: String?, gender: String?) async throws -> CharactersModel
    func getEpisodesAsync(for page: Int) async throws -> EpisodesModel
    func getEpisodesAsync(_ episodes: [Int]) async throws -> [EpisodeModel]
    
    // Callback
    func getCharacters(for page: Int, name: String?, status: String?, gender: String?, completion: @escaping (Result<CharactersModel, APIError>) -> Void)
    func getEpisodes(for page: Int, completion: @escaping (Result<EpisodesModel, APIError>) -> Void)
    func getEpisodes(_ episodes: [Int], completion: @escaping (Result<[EpisodeModel], APIError>) -> Void)
}

struct RAMRepositoryImpl: RAMRespository {
    let dataSource: RAMDataSource
}

// MARK: - Combine
extension RAMRepositoryImpl {
    func getCharacters(for page: Int, name: String?, status: String?, gender: String?) -> AnyPublisher<CharactersModel, APIError> {
        dataSource.getCharacters(for: page, name: name, status: status, gender: gender)
            .map { CharactersModel($0) }
            .eraseToAnyPublisher()
    }

    func getEpisodes(for page: Int) -> AnyPublisher<EpisodesModel, APIError> {
        dataSource.getEpisodes(for: page)
            .map { EpisodesModel($0) }
            .eraseToAnyPublisher()
    }
    
    func getEpisodes(_ episodes: [Int]) -> AnyPublisher<[EpisodeModel], APIError> {
        dataSource.getEpisodes(episodes)
            .map { $0.map { EpisodeModel($0) }}
            .eraseToAnyPublisher()
    }
}

// MARK: - Async/Await
extension RAMRepositoryImpl {
    func getCharactersAsync(for page: Int, name: String?, status: String?, gender: String?) async throws -> CharactersModel {
        let characters = try await dataSource.getCharactersAsync(for: page, name: name, status: status, gender: gender)
        return CharactersModel(characters)
    }
    
    func getEpisodesAsync(for page: Int) async throws -> EpisodesModel {
        let episodes = try await dataSource.getEpisodesAsync(for: page)
        return EpisodesModel(episodes)
    }

    func getEpisodesAsync(_ episodes: [Int]) async throws -> [EpisodeModel] {
        try await dataSource.getEpisodesAsync(episodes).map { EpisodeModel($0) }
    }
}

// MARK: - Callback
extension RAMRepositoryImpl {
    func getCharacters(for page: Int, name: String?, status: String?, gender: String?, completion: @escaping (Result<CharactersModel, APIError>) -> Void) {
        dataSource.getCharacters(for: page, name: name, status: status, gender: gender) { result in
            switch result {
            case .success(let model):
                completion(.success(CharactersModel(model)))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
    
    func getEpisodes(for page: Int, completion: @escaping (Result<EpisodesModel, APIError>) -> Void) {
        dataSource.getEpisodes(for: page) { result in
            switch result {
            case .success(let model):
                completion(.success(EpisodesModel(model)))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
    
    func getEpisodes(_ episodes: [Int], completion: @escaping (Result<[EpisodeModel], APIError>) -> Void) {
        dataSource.getEpisodes(episodes) { result in
            switch result {
            case .success(let model):
                completion(.success(model.map { EpisodeModel($0) }))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
