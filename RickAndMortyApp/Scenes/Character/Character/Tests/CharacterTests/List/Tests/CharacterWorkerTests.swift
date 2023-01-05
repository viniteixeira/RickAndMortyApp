@testable import Character
import XCTest

final class CharacterWorkerTests: XCTestCase {
    
    // MARK: Properties
    var sut: CharacterWorkerProtocol!
    var spy: CharacterCoordinatorSpy!
    
    // MARK: SetUp
    override func setUp() {
        super.setUp()
        
        spy = CharacterCoordinatorSpy()
        let repository: CharacterRepositoryProtocol = CharacterRepositoryMock()
        sut = CharacterWorker(repository: repository, coordinator: spy)
    }
    
    // MARK: TearDown
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        spy = nil
    }
    
    // MARK: Tests
    func testFetchCaractersSuccess() {
        sut.fetchCharacters { result in
            switch result {
            case .success(let characters):
                XCTAssertEqual(characters.count, 20)
            case .failure: ()
            }
        }
    }
}

final class CharacterRepositoryTests: XCTestCase {
    
    // MARK: Properties
    var sut: CharacterRepository!
    
    // MARK: SetUp
    override func setUp() {
        super.setUp()
        
        sut = CharacterRepository()
    }
    
    // MARK: TearDown
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    // MARK: Tests
    func testFetchCaracters() {
        sut.fetchCharacters { result in
            
            switch result {
            case .success(let characters):
                XCTAssertEqual(characters.results.count, 20)
            case .failure: ()
            }
        }
    }
}
