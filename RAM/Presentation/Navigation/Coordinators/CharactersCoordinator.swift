//
//  CharactersCoordinator.swift
//  RAM
//
//  Created by Mario Corte on 2/16/25.
//

import SwiftUI

enum CharactersSteps: Steps {
    case detail(viewModel: CharacterViewModel)
    case filter
}

extension CharactersSteps: Identifiable {
    var id: String {
        switch self {
        case .detail:
            "characterDetail"
        case .filter:
            "charactersFilter"
        }
    }
}

class CharactersCoordinator: ObservableObject {
    @Published var path: [CharactersSteps] = []
        
    func pushToDetail(viewModel: CharacterViewModel) {
        path.append(CharactersSteps.detail(viewModel: viewModel))
    }
    
    func pop() {
        path.removeLast()
    }
}

extension CharactersCoordinator: AppCoordinator {
    @ViewBuilder
    func redirect(_ path: CharactersSteps) -> some View {
        switch path {
        case .detail(let viewModel):
            let detailViewModel = CharacterDetailViewModel(coordinator: self, characterViewModel: viewModel)
            CharacterDetailView(viewModel: detailViewModel)
        case .filter:
            EmptyView()
        }
    }
}
