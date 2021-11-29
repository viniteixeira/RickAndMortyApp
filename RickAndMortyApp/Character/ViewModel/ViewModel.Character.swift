//
//  ViewModel.Character.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 11/11/21.
//

extension ViewModel {
    
    class Character {
        
        // MARK: Properties
        var worker: Worker.Character
        var characters: [Model.Character] = []
        
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
                case .failure: ()
                }
            }
        }
    }
}
