//
//  Model.Character.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 11/11/21.
//

extension Model {
    
    struct Character {
        
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
        
        // MARK: Structs
        struct Info {
            let name: String
            let url: String
        }
    }
}
