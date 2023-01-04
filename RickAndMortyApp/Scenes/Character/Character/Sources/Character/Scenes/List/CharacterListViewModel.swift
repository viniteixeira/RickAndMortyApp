import Foundation
import Core

// MARK: - CharacterListViewModelProtocol
protocol CharacterListViewModelProtocol {
    var state: Observable<CharacterListViewModel.State> { get }
    var characters: [Character] { get }
    
    func fetchCharacters()
    func didSelect(_ character: Character)
}


// MARK: - CharacterListViewModel.State
extension CharacterListViewModel {
    enum State {
        case loadingData
        case loadedData
    }
}

// MARK: - CharacterListViewModel
class CharacterListViewModel {
    
    // MARK: Properties
    var state: Observable<CharacterListViewModel.State> = .init(.loadingData)
    var characters: [Character] = []
    
    // MARK: Private Properties
    private let worker: CharacterWorkerProtocol
    
    // MARK: Inits
    init(worker: CharacterWorkerProtocol) {
        self.worker = worker
    }
}

// MARK: - CharacterListViewModel+CharacterListViewModelProtocol
extension CharacterListViewModel: CharacterListViewModelProtocol {
    func fetchCharacters() {
        worker.fetchCharacters { result in
            switch result {
            case .success(let characters):
                self.characters = characters
                self.state.value = .loadedData
            case .failure: ()
            }
        }
    }
    
    func didSelect(_ character: Character) {
        worker.didSelect(character)
    }
}
