//
//  Episode.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

public struct Episode: Codable {
    public let id: Int
    public let name: String
    public let air_date: String
    public let episode: String
    public let characters: [String]
    public let url: String
    public let created: String
    
    public init(id: Int, name: String, air_date: String, episode: String, characters: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.air_date = air_date
        self.episode = episode
        self.characters = characters
        self.url = url
        self.created = created
    }
}
