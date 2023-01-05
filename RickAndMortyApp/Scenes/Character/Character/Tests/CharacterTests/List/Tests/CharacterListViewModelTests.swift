import XCTest
@testable import Character

final class CharacterListViewModelTests: XCTestCase {
    
    // MARK: Properties
    var sut: CharacterListViewModel!
    var worker: CharacterWokerMock!
    
    // MARK: SetUp
    override func setUp() {
        super.setUp()
        worker = CharacterWokerMock()
        sut = CharacterListViewModel(worker: worker)
    }
    
    // MARK: TearDown
    override func tearDown() {
        super.tearDown()
        
        worker = nil
        sut = nil
    }
    
    // MARK: Tests
    func testFetchCaractersSuccess() {
        sut.fetchCharacters()
        XCTAssertEqual(sut.characters.count, 2)
    }
    
    func testDidSelectCharacter() {
        sut.didSelect(.init())
        XCTAssertTrue(worker.didSelectCharacter)
    }
}
