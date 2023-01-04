import Foundation
import Episode

// MARK: - CharacterWorkerProtocol
protocol CharacterWorkerProtocol {
    func fetchCharacters(completion: @escaping(Result<[Character], Error>) -> Void)
    func didSelect(_ character: Character)
}

// MARK: - CharacterWorker
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

// MARK: - CharacterWorker+CharacterWorkerProtocol
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
    
    func didSelect(_ character: Character) {
        var episodes: [Episode] = []
        let episodeWorker: EpisodeWorkerProtocol = EpisodeWorker()
        let group: DispatchGroup = .init()
        
        character.episode.forEach { episodeURL in
            group.enter()
            episodeWorker.fetchEpisode(episodeURL) { result in
                switch result {
                case .success(let episode):
                    episodes.append(episode)
                case .failure: ()
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.sendToDetailCharacter(character, episodes: episodes)
        }
    }
}

// MARK: - Private Methods
private extension CharacterWorker {
    func sendToDetailCharacter(_ character: Character, episodes: [Episode]) {
        coordinator.sendToCharacterDetail(character, episodes: episodes)
    }
}
