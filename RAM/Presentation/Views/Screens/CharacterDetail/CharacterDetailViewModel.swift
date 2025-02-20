//
//  CharacterDetailViewModel.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI

class CharacterDetailViewModel {
    let characterViewModel: CharacterViewModel
    var coordinator: CharactersCoordinator
    
    init(characterViewModel: CharacterViewModel, coordinator: CharactersCoordinator) {
        self.characterViewModel = characterViewModel
        self.coordinator = coordinator
    }
}
