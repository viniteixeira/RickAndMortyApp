//
//  ViewModel.Character.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 11/11/21.
//

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
    }
}
