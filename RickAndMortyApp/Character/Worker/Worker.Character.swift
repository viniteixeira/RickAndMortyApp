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
        
        // MARK: Initializers
        init(repository: Repository.Character) {
            self.repository = repository
        }
        
        // MARK: Methods
        func fetchCharacters(completion: @escaping(Result<[Model.Character], Error>) -> Void) {
            repository.fetchCharacters { result in
                switch result {
                case .success(let data):
                    var characters: [Model.Character] = []
                    data.results.forEach { character in
                        characters.append(
                            .init(
                                id: character.id ?? 0,
                                name: character.name ?? "",
                                status: character.status ?? "",
                                species: character.species ?? "",
                                type: character.type ?? "",
                                gender: character.gender ?? "",
                                origin: .init(name: character.origin.name, url: character.origin.url),
                                location: .init(name: character.location.name, url: character.location.url),
                                image: character.image,
                                episode: character.episode,
                                url: character.url,
                                created: character.created)
                        )
                    }
                    completion(.success(characters))
                case .failure: ()
                }
            }
        }
    }
}
