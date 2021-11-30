//
//  ViewModel.Character.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 11/11/21.
//

import Foundation

extension ViewModel {
    
    class Character {

        // MARK: State
        enum State {
            case loadingData
            case loadedData
        }
        
        // MARK: Properties
        private var worker: Worker.Character
        var characters: [Model.Character] = []
        var state: Observable<State> = .init(.loadingData)
        
        // MARK: Initializers
        init(worker: Worker.Character) {
            self.worker = worker
        }
        
        // MARK: Methods
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

        func selected(_ character: Model.Character) {
            let group = DispatchGroup()
            var episodes: [Model.Episode] = []

            character.episode.forEach { episodeURL in
                group.enter()
                self.worker.fetchEpisode(episodeURL) { result in
                    switch result {
                    case .success(let episode):
                        episodes.append(episode)
                    case .failure: ()
                    }
                    group.leave()
                }
            }

            group.notify(queue: .main) {
                character.episodes = episodes
                self.worker.sendToCharacterView(character)
            }
        }
    }
}
