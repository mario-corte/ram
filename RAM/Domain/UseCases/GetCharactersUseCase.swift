//
//  GetCharactersUseCase.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import Combine
import RAMData

struct GetCharactersUseCase {
    let repository: RAMRespository = RAMRepositoryImpl(dataSource: RAMDataSourceImpl())
    
    // Combine
    func getCharacters(for page: Int, name: String) -> AnyPublisher<CharactersModel, APIError> {
        repository.getCharacters(for: page, name: name)
    }
    
    // Async/Await
    func getCharactersAsync(for page: Int, name: String?, status: String?, gender: String?) async throws -> CharactersModel {
        try await repository.getCharactersAsync(for: page, name: name, status: status, gender: gender)
    }
}
