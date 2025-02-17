//
//  CharactersBuilder.swift
//  RAMTests
//
//  Created by Mario Corte on 2/15/25.
//

import RAMData

class CharactersBuilder: BaseEntityBuilder {
    public var info: CharactersInfo = CharactersInfoBuilder().build()
    public var results: [Character] = [CharacterBuilder().build()]
    
    func build() -> Characters {
        return Characters(info: info, results: results)
    }
}

class CharactersInfoBuilder: BaseEntityBuilder {
    public let count: Int = 20
    public let pages: Int = 1
    public let next: String? = "nextUrl"
    public let prev: String? = "prevUrl"
    
    func build() -> CharactersInfo {
        return CharactersInfo(count: count, pages: pages, next: next, prev: prev)
    }
}

class CharacterBuilder: BaseEntityBuilder {
    public var id: Int = 1
    public var name: String = "Rick"
    public var status: CharacterStatus = .Alive
    public var species: String = "Human"
    public var type: String = ""
    public var gender: CharacterGender = .Male
    public var origin: CharacterOrigin = CharacterOriginBuilder().build()
    public var location: CharacterLocation = CharacterLocationBuilder().build()
    public var imageUrl: String = "imageURL"
    public var episode: [String] = ["episode1URL", "episode2URL"]
    public var url: String = "url"
    public var created: String = "2021-10-15T17:00:24.105Z"
    
    func build() -> Character {
        return Character(id: id,
                         name: name,
                         status: status,
                         species: species,
                         type: type,
                         gender: gender,
                         origin: origin,
                         location: location,
                         image: imageUrl,
                         episode: episode,
                         url: url,
                         created: created)
    }
}

class CharacterOriginBuilder: BaseEntityBuilder {
    public var name: String = "Earth"
    public var url: String = "url"
    
    func build() -> CharacterOrigin {
        return CharacterOrigin(name: name, url: url)
    }
}

class CharacterLocationBuilder: BaseEntityBuilder {
    public var name: String = "Citadel of Ricks"
    public var url: String = "url"
    
    func build() -> CharacterLocation {
        return CharacterLocation(name: name, url: url)
    }
}
