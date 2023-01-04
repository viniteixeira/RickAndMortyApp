import Foundation

protocol CharacterWorkerProtocol {
    func fetchCharacters(completion: @escaping(Result<[Character], Error>) -> Void)
}

class CharacterWorker {
    
    // MARK: Private Properties
    private let repository: CharacterRepositoryProtocol
    private let coordinator: CharacterCoordinatorProtocol
    
    // MARK: Inits
    init(repository: CharacterRepositoryProtocol = CharacterRepository(), coordinator: CharacterCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

extension CharacterWorker: CharacterWorkerProtocol {
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        repository.fetchCharacters { result in
            switch result {
            case .success(let data):
                var characters: [Character] = []
                data.results.forEach { character in
                    characters.append(character.toModelCharacter())
                }
                completion(.success(characters))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
