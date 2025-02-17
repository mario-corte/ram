//
//  Characters.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

public struct Characters: Codable {
    public let info: CharactersInfo
    public let results: [Character]
    
    public init(info: CharactersInfo, results: [Character]) {
        self.info = info
        self.results = results
    }
}

public struct CharactersInfo: Codable {
    public let count: Int
    public let pages: Int
    public let next: String?
    public let prev: String?
    
    public init(count: Int, pages: Int, next: String?, prev: String?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}

