//
//  RAMDomainTests.swift
//  RAMTests
//
//  Created by Mario Corte on 2/15/25.
//

import XCTest
import RAMData
@testable import RAM

final class RAMDomainTests: XCTestCase {
    var sut: GetCharactersUseCase!
    
    override func setUp() {
        super.setUp()
        sut = GetCharactersUseCase(repository: RAMRepositoryImpl(dataSource: RAMDataSourceMock()))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}

// MARK: - Get Characters

extension RAMDomainTests {
    func testGetCharacters() async {
        let charactersBuilder = CharactersModel(CharactersBuilder().build())
        do {
            let characters = try await sut.getCharactersAsync(for: 1, name: nil, status: nil, gender: nil)
            XCTAssertNil(characters.prev)
            XCTAssertTrue(characters.characters.first?.id == charactersBuilder.characters.first?.id)
        }
        catch {
            XCTAssertNil(error)
        }
    }
    
    func testGetCharactersError() async {
        do {
            let characters = try await sut.getCharactersAsync(for: 0, name: nil, status: nil, gender: nil)
            XCTAssertTrue(characters.characters.isEmpty)
        }
        catch {
            XCTAssertNotNil(error)
        }
    }
}
