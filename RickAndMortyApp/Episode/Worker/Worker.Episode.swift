//
//  Worker.Episode.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 30/11/21.
//

import Foundation

extension Worker {

    class Episode {

        // MARK: Properties
        private var repository: Repository.Episode
        private var coordinator: CoordinatorEpisodeProtocol

        // MARK: Initializers
        init(repository: Repository.Episode, coordinator: CoordinatorEpisodeProtocol) {
            self.repository = repository
            self.coordinator = coordinator
        }

        // MARK: Methods
        func fetchEpisode(_ id: String, completion: @escaping(Result<Model.Episode, Error>)->Void) {
            repository.fetchEpisode(Service.baseURL+"episode/\(id)") { result in
                
            }
        }
    }
}
