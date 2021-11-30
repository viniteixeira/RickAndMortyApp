//
//  Model.Episode.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 30/11/21.
//

extension Model {

    class Episode {

        // MARK: Properties
        var id: Int = 0
        var name: String = ""
        var episode: String = ""

        // MARK: Initializers
        init() {}
        
        init(id: Int, name: String, episode: String) {
            self.id = id
            self.name = name
            self.episode = episode
        }
    }
}
