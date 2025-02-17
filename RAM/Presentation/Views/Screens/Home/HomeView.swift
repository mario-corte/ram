//
//  HomeView.swift
//  RAM
//
//  Created by Mario Corte on 2/16/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var charactersCoordinator = CharactersCoordinator()
    private var charactersListViewModel: CharactersListViewModel!
    
    init() {
        charactersListViewModel = CharactersListViewModel(coordinator: charactersCoordinator)
    }
    
    var body: some View {
        TabView {
            CharactersListView(viewModel: charactersListViewModel)
            EpisodesListView()
            LocationsListView()
            AboutView()
        }
    }
}
