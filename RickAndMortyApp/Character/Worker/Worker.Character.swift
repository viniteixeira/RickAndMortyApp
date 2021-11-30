//
//  Worker.Character.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 11/11/21.
//

extension Worker {
    
    class Character {
        
        // MARK: Properties
        private let repository: Repository.Character
        private let coordinator: Coordinator.Character
        private let episodeRepository: Repository.Episode
        
        // MARK: Initializers
        init(repository: Repository.Character, coordinator: Coordinator.Character) {
            self.repository = repository
            self.coordinator = coordinator
            self.episodeRepository = .init()
        }
        
        // MARK: Methods
        func fetchCharacters(completion: @escaping(Result<[Model.Character], Error>) -> Void) {
            repository.fetchCharacters { result in
                switch result {
                case .success(let data):
                    var characters: [Model.Character] = []
                    data.results.forEach { character in
                        characters.append(character.toModelCharacter())
                    }
                    completion(.success(characters))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }

        func fetchEpisode(_ episodeURL: String, completion: @escaping(Result<Model.Episode, Error>) -> Void) {
            episodeRepository.fetchEpisode(episodeURL) { result in
                switch result {
                case .success(let data):
                    completion(.success(data.toModelEpisode()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }

        func sendToCharacterView(_ character: Model.Character, viewModel: ViewModel.Character) {
            coordinator.sendToCharacterController(character, viewModel: viewModel)
        }

        func sendToEpisodeView(_ episode: Model.Episode) {
            coordinator.sendToEpisodeController(episode)
        }
    }
}
