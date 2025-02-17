//
//  EpisodesBuilder.swift
//  RAMTests
//
//  Created by Mario Corte on 2/15/25.
//

import RAMData

class EpisodesBuilder: BaseEntityBuilder {
    public var info: EpisodesInfo = EpisodesInfoBuilder().build()
    public var results: [Episode] = [EpisodeBuilder().build()]
    
    func build() -> Episodes {
        return Episodes(info: info, results: results)
    }
}

class EpisodesInfoBuilder: BaseEntityBuilder {
    public let count: Int = 10
    public let pages: Int = 1
    public let next: String? = "nextUrl"
    public let prev: String? = "prevUrl"
    
    func build() -> EpisodesInfo {
        return EpisodesInfo(count: count, pages: pages, next: next, prev: prev)
    }
}

class EpisodeBuilder: BaseEntityBuilder {
    public let id: Int = 1
    public let name: String = "Pilot"
    public let air_date: String = "December 2, 2013"
    public let episode: String = "S01E01"
    public let characters: [String] = ["characterUrl"]
    public let url: String = "url"
    public let created: String = "2017-11-10T12:56:33.798Z"
    
    func build() -> Episode {
        return Episode(id: id,
                       name: name,
                       air_date: air_date,
                       episode: episode,
                       characters: characters,
                       url: url,
                       created: created)
    }
}
