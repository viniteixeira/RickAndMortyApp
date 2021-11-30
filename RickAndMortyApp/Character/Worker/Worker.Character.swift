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
        
        // MARK: Initializers
        init(repository: Repository.Character, coordinator: Coordinator.Character) {
            self.repository = repository
            self.coordinator = coordinator
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
                case .failure: ()
                }
            }
        }

        func sendToCharacterView(_ character: Model.Character) {
            coordinator.sendToCharacterController(character)
        }
    }
}
