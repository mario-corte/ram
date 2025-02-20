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
    private var episodesListViewModel: EpisodesListViewModel!
    private var locationsListViewModel: LocationsListViewModel!
    
    init() {
        charactersListViewModel = CharactersListViewModel(coordinator: charactersCoordinator)
        episodesListViewModel = EpisodesListViewModel()
        locationsListViewModel = LocationsListViewModel()
    }
    
    var body: some View {
        TabView {
            CharactersListView(viewModel: charactersListViewModel)
            EpisodesListView(viewModel: episodesListViewModel)
            LocationsListView(viewModel: locationsListViewModel)
            AboutView()
        }
    }
}
