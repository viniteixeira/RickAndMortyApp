import Foundation
import Episode

protocol CharacterDetailViewModelProtocol {
    var character: Character { get }
    var episodes: [Episode] { get }
}

class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    
    // MARK: Properties
    var character: Character
    var episodes: [Episode]
    
    // MARK: Init
    init(character: Character, episodes: [Episode]) {
        self.character = character
        self.episodes = episodes
    }
}
