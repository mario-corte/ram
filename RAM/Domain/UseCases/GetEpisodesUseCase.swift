//
//  GetEpisodesUseCase.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import Combine
import RAMData

struct GetEpisodesUseCase {
    let repository: RAMRespository = RAMRepositoryImpl(dataSource: RAMDataSourceImpl())
    
    // Combine
    func getEpisodes(for page: Int) -> AnyPublisher<EpisodesModel, APIError> {
        repository.getEpisodes(for: page)
    }
     
    // Async/Await
    func getEpisodes(_ episodes: [Int]) async throws -> [EpisodeModel] {
        try await repository.getEpisodesAsync(episodes)
    }
}
