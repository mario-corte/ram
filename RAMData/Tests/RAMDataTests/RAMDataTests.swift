import XCTest
@testable import RAMData

final class RAMDataTests: XCTestCase {
    final class RAMDataTests: XCTestCase {
        var sut: RAMDataSource!
        
        override func setUp() {
            super.setUp()
            sut = RAMDataSourceImpl()
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
                let characters = try await sut.getCharactersAsync(for: 1, name: "dasdas", status: "dsdasdas", gender: "dqdwqdwq")
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
                let episodes = try await sut.getEpisodesAsync([1])
                XCTAssertTrue(episodes.count == 1)
                XCTAssertTrue(episodes.first?.id == episodesBuilder.results.first?.id)
            }
            catch {
                XCTAssertNil(error)
            }
        }
        
        func testGetEpisodesWithError() async {
            do {
                let episodes = try await sut.getEpisodesAsync([])
                XCTAssertTrue(episodes.count == 0)
            }
            catch {
                XCTAssertNotNil(error)
            }
        }
    }

}
