@testable import Character
@testable import Episode
import Foundation
import Core

class CharacterViewModelsMock {
    static let coordinator: CharacterCoordinatorProtocol = CharacterCoordinatorSpy()
    static let repository: CharacterRepositoryProtocol = CharacterRepositoryMock()
    static let worker: CharacterWorkerProtocol = CharacterWorker(repository: repository, coordinator: coordinator)
    
    static func getListViewModelMock() -> CharacterListViewModelProtocol {
//        let worker: CharacterWorkerProtocol = CharacterWorker(repository: repository, coordinator: coordinator)
        return CharacterListViewModel(worker: worker)
    }
    
}

final class CharacterWokerMock: CharacterWorkerProtocol {
    
    // MARK: Properties
    var didSelectCharacter: Bool = false
    private let repository = CharacterRepositoryMock()
    
    // MARK: CharacterWorkerProtocol
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        repository.fetchCharacters { result in
            switch result {
            case .success(let response):
                let first = response.results.first!.toModelCharacter()
                let last = response.results.last!.toModelCharacter()
                completion(.success([first, last]))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func didSelect(_ character: Character) {
        didSelectCharacter.toggle()
    }
}

final class CharacterRepositoryMock: CharacterRepositoryProtocol {
    var shouldFailFetchCharacters: Bool = false
    
    func fetchCharacters(completion: @escaping (Result<Character.Repository, Error>) -> Void) {
        if let path = Bundle.module.path(forResource: "characters", ofType: "json"), !shouldFailFetchCharacters {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder: JSONDecoder = .init()
            let result = try! decoder.decode(Character.Repository.self, from: data)
            completion(.success(result))
        } else {
            completion(.failure(NSError(domain: "An error occurred while fetching the characters.", code: 0)))
        }
    }
}
