@testable import Character
import XCTest

final class CharacterCoordinatorTests: XCTestCase {
    
    // MARK: Properties
    var sut: CharacterCoordinatorProtocol!
    var navController: UINavigationController!
    var window: UIWindow!
    
    // MARK: SetUp
    override func setUp() {
        super.setUp()
        
        navController = UINavigationController()
        sut = CharacterCoordinator(navController: navController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
    // MARK: TearDown
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        navController = nil
        window = nil
    }
    
    // MARK: Tests
    func testInstatiate() {
        XCTAssertNil(navController.visibleViewController)
        sut.instatiate()
        XCTAssert(navController.visibleViewController is CharacterListViewController)
    }
    
    func testInstatiates() {
        sut.sendToCharacterDetail(.init(), episodes: [])
        XCTAssert(navController.visibleViewController is CharacterDetailViewController)
    }
}
