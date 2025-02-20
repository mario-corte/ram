//
//  RAMDataTests.swift
//  RAMTests
//
//  Created by Mario Corte on 2/15/25.
//

import XCTest
import RAMData

final class RAMDataTests: XCTestCase {
    var sut: RAMDataSource!
    
    override func setUp() {
        super.setUp()
        sut = RAMDataSourceMock()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}

// MARK: - Get Characters

extension RAMDataTests {
    func testGetCharacters() async {
        let charactersBuilder = CharactersBuilder().build()
        do {
            let characters = try await sut.getCharactersAsync(for: 1, name: nil, status: nil, gender: nil)
            XCTAssertNil(characters.info.prev)
            XCTAssertTrue(characters.results.first?.id == charactersBuilder.results.first?.id)
        }
        catch {
            XCTAssertNil(error)
        }
    }
    
    func testGetCharactersWithError() async {
        do {
            let characters = try await sut.getCharactersAsync(for: 0, name: nil, status: nil, gender: nil)
            XCTAssertTrue(characters.results.isEmpty)
        }
        catch {
            XCTAssertNotNil(error)
        }
    }
}

// MARK: - Get Episodes

extension RAMDataTests {
    func testGetEpisodes() async {
        let episodesBuilder = EpisodesBuilder().build()
        do {
            let episodes = try await sut.getEpisodesAsync(for: 1)
            XCTAssertNil(episodes.info.prev)
            XCTAssertTrue(episodes.results.first?.id == episodesBuilder.results.first?.id)
        }
        catch {
            XCTAssertNil(error)
        }
    }
    
    func testGetEpisodesWithError() async {
        do {
            let episodes = try await sut.getEpisodesAsync(for: 0)
            XCTAssertTrue(episodes.results.isEmpty)
        }
        catch {
            XCTAssertNotNil(error)
        }
    }
}


// MARK: - Get Character Episodes

extension RAMDataTests {
    func testGetCharacterEpisodes() async {
        let episodesBuilder = EpisodesBuilder().build()
        do {
            let episodes = try await sut.getEpisodesAsync([1,2,3,4,5])
            XCTAssertTrue(episodes.count == 5)
            XCTAssertTrue(episodes.first?.id == episodesBuilder.results.first?.id)
        }
        catch {
            XCTAssertNil(error)
        }
    }
    
    func testGetCharacterEpisodesWithError() async {
        do {
            let episodes = try await sut.getEpisodesAsync([])
            XCTAssertTrue(episodes.count == 0)
        }
        catch {
            XCTAssertNotNil(error)
        }
    }
}
