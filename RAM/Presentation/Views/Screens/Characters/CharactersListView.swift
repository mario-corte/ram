//
//  CharactersListView.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI

struct CharactersListView: View {
    @ObservedObject var viewModel: CharactersListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .Loading:
                    loadingView
                case .DataEmpty:
                    dataEmptyView
                default:
                    contentView
                }
            }
            .navigationBarTitle("characters", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.showingFilterSheet.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                    .sheet(isPresented: $viewModel.showingFilterSheet) {
                        viewModel.updateFilters()
                    } content: {
                        FilterView(viewModel: viewModel.filterViewModel)
                    }
                }
            }
            .applyNavigation(coordinator: viewModel.coordinator)
        }
        .searchable(text: $viewModel.searchText, prompt: "character.name")
        .task {
            await viewModel.loadCharactersAsync()
        }
        .tabItem {
            Label("characters", systemImage: "atom")
        }
    }
}

private extension CharactersListView {
    var contentView: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                itemsView
                switch viewModel.state {
                case .Data:
                    loadingView
                        .onAppear {
                            Task {
                                await viewModel.loadMoreCharactersAsync()
                            }
                        }
                case .LoadingNextPage:
                    loadingView
                case .Error:
                    errorLoadingView
                default:
                    emptyView
                }
            }
            .padding(.horizontal)
        }
    }
    
    var itemsView: some View {
        ForEach(viewModel.characters, id: \.self) { character in
            CharacterItemView(viewModel: character)
                .padding(.top, 4)
                .onTapGesture {
                    viewModel.coordinator.pushToDetail(viewModel: character)
                }
        }
    }
    
    var loadingView: some View {
        ProgressView()
            .padding(.top, 6)
            .padding(.bottom, 32)
    }
    
    var dataEmptyView: some View {
        ErrorEmptyView(viewModel: viewModel.errorViewModel)
    }
        
    var errorLoadingView: some View {
        ErrorLoadingView(viewModel: viewModel.errorLoadingViewModel)
    }
    
    var emptyView: some View {
        EmptyView()
    }
}
