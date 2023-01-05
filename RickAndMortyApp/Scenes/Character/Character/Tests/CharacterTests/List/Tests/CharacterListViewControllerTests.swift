@testable import Character
import XCTest

//final class CharacterListViewControllerTests: XCTest {
//    
//    // MARK: Properties
//    var sut: CharacterListViewController!
//    var viewModel: CharacterListViewModelProtocol!
//    
//    // MARK: SetUp
//    override func setUp() {
//        super.setUp()
//        
//        viewModel = CharacterViewModelsMock.getListViewModelMock()
//        sut = CharacterListViewController(viewModel: viewModel)
//    }
//    
//    // MARK: TearDown
//    override func tearDown() {
//        super.tearDown()
//        
//        sut = nil
//        viewModel = nil
//    }
//    
//    // MARK: Tests
//    func testTableViewDidSelect() {
//        viewModel.state.value
//        XCTAssertFalse(sut.characters.isEmpty)
//    }
//    
//    func testDidSelectCharacter() {
//        sut.fetchCharacters()
//        sut.didSelect(sut.characters.last!)
//        print(spy.didSendToDetail)
//        XCTAssertTrue(spy.didSendToDetail)
//    }
//}
