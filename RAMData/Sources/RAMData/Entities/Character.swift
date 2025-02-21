//
//  Character.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

public struct Character: Codable {
    public let id: Int
    public let name: String
    public let status: CharacterStatus
    public let species: String
    public let type: String
    public let gender: CharacterGender
    public let origin: CharacterOrigin
    public let location: CharacterLocation
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
    
    public init(id: Int, name: String, status: CharacterStatus, species: String, type: String, gender: CharacterGender, origin: CharacterOrigin, location: CharacterLocation, image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

public enum CharacterStatus: String, Codable {
    case Alive = "Alive"
    case Dead = "Dead"
    case Unknown = "unknown"
}

public enum CharacterGender: String, Codable {
    case Female = "Female"
    case Male = "Male"
    case Genderless = "Genderless"
    case Unknown = "unknown"
}

public struct CharacterOrigin: Codable {
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

public struct CharacterLocation: Codable {
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
