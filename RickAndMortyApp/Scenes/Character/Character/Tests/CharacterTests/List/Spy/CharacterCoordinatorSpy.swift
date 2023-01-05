@testable import Character
@testable import Episode
import Foundation

final class CharacterCoordinatorSpy: CharacterCoordinatorProtocol {
    
    // MARK: Properties
    var didSendToDetail: Bool = false
    
    // MARK: CharacterCoordinatorProtocol
    func instatiate() {}
    func sendToCharacterDetail(_ character: Character, episodes: [Episode]) {
        didSendToDetail.toggle()
        print(didSendToDetail)
    }
}
