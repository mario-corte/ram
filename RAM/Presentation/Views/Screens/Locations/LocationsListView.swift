//
//  LocationsListView.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI

struct LocationsListView: View {
    @ObservedObject var viewModel: LocationsListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .Loading:
                    loadingView
                case .Data:
                    contentView
                case .DataEmpty:
                    errorView
                }
            }
            .navigationBarTitle("locations", displayMode: .large)
        }
        .task {
            viewModel.loadLocations()
        }
        .tabItem {
            Label("locations", systemImage: "map")
        }
    }
}

private extension LocationsListView{
    var contentView: some View {
        EmptyView()
    }
    
    var loadingView: some View {
        ProgressView()
    }
    
    var errorView: some View {
        ErrorEmptyView(viewModel: viewModel.errorViewModel)
    }
}
