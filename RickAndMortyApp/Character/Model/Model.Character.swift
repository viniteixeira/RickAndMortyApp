//
//  Model.Character.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 11/11/21.
//

extension Model {
    
    class Character {

        // MARK: Properties
        let id: Int
        let name: String
        let status: String
        let species: String
        let type: String
        let gender: String
        let origin: Info
        let location: Info
        let image: String
        let episode: [String]
        let url: String
        let created: String
        var episodes: [Model.Episode] = []

        // MARK: Initalizers
        init() {
            self.id = 0
            self.name = ""
            self.status = ""
            self.species = ""
            self.type = ""
            self.gender = ""
            self.origin = .init(name: "", url: "")
            self.location = .init(name: "", url: "")
            self.image = ""
            self.episode = []
            self.url = ""
            self.created = ""
        }
        
        init(id: Int, name: String, status: String,
             species: String, type: String, gender: String,
             origin: Model.Character.Info, location: Model.Character.Info,
             image: String, episode: [String], url: String, created: String) {
            self.id = id
            self.name = name
            self.status = status
            self.species = species
            self.type = type
            self.gender = gender
            self.origin = origin
            self.location = location
            self.image = image
            self.episode = episode
            self.url = url
            self.created = created
        }
        
        // MARK: Structs
        struct Info {
            let name: String
            let url: String
        }
    }
}
