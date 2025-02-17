//
//  EpisodeViewModel.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import Foundation

struct EpisodeViewModel: Identifiable {
    let id: UUID
    let number: String
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    init(_ episode: EpisodeModel) {
        self.id = UUID(uuidString: String(episode.id)) ?? UUID()
        self.number = (episode.id < 10) ? "\(0)\(episode.id)" : String(episode.id)
        self.name = episode.name
        self.air_date = episode.air_date
        self.episode = episode.episode
        self.characters = episode.characters
        self.url = episode.url
        self.created = episode.created
    }
}
