//
//  GetCharactersUseCase.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import Combine
import RAMData

struct GetCharactersUseCase {
    var repository: RAMRespository = RAMRepositoryImpl(dataSource: RAMDataSourceImpl())
    
    init() { }
    
    init(repository: RAMRespository) {
        self.repository = repository
    }
    
    // Combine
    func getCharacters(for page: Int, name: String?, status: String?, gender: String?) -> AnyPublisher<CharactersModel, APIError> {
        repository.getCharacters(for: page, name: name, status: status, gender: gender)
    }
    
    // Async/Await
    func getCharactersAsync(for page: Int, name: String?, status: String?, gender: String?) async throws -> CharactersModel {
        try await repository.getCharactersAsync(for: page, name: name, status: status, gender: gender)
    }
}
