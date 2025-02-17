//
//  CharacterDetailViewModel.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI

class CharacterDetailViewModel {
    @Published var coordinator: CharactersCoordinator!
    let characterViewModel: CharacterViewModel
    
    init(characterViewModel: CharacterViewModel) {
        self.characterViewModel = characterViewModel
    }
    
    init(coordinator: CharactersCoordinator, characterViewModel: CharacterViewModel) {
        self.coordinator = coordinator
        self.characterViewModel = characterViewModel
    }
}
