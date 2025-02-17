//
//  MainView.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI

struct MainView: View {
    init() {
//        UITabBar.appearance().barTintColor = .systemBackground
//        UITabBar.appearance().unselectedItemTintColor = .gray
    }
    
    var body: some View {
        TabView {
            CharactersListView()
            EpisodesListView()
            LocationsListView()
            AboutView()
        }
//        .tint(.accent)
    }
}

