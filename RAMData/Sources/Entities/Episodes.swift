//
//  Episodes.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

public struct Episodes: Codable {
    public let info: EpisodesInfo
    public let results: [Episode]
    
    public init(info: EpisodesInfo, results: [Episode]) {
        self.info = info
        self.results = results
    }
}

public struct EpisodesInfo: Codable {
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
