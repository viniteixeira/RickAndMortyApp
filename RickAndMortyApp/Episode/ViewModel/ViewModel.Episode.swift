//
//  ViewModel.Episode.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 30/11/21.
//

import Foundation

extension ViewModel {

    class Episode {

        enum State {
            case loadingData
            case loadedData
        }

        // MARK: Properties
        private let worker: Worker.Episode
        var episode: Model.Episode
        var state: Observable<State> = .init(.loadedData)

        // MARK: Initializers
        init(worker: Worker.Episode, episode: Model.Episode) {
            self.worker = worker
            self.episode = episode
        }

        // MARK: Methods
        func fetchEpisode() {
            worker.fetchEpisode(episode.id.description) { result in
                switch result {
                case .success(let episode):
                    self.episode = episode
                    self.state.value = .loadedData
                case .failure: ()
                }
            }
        }
    }
}
