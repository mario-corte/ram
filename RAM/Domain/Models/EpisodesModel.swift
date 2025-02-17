//
//  EpisodesModel.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import RAMData

struct EpisodesModel {
    let count: Int
    let pages: Int
    var next: String?
    var prev: String?
    let episodes: [EpisodeModel]
    
    init(_ episodes: Episodes) {
        self.count = episodes.info.count
        self.pages = episodes.info.pages
        self.episodes = episodes.results.map { EpisodeModel($0) }
    }
}
