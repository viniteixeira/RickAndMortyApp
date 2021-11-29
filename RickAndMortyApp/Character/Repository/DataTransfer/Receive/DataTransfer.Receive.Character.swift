//
//  DataTransfer.Receive.Character.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 11/11/21.
//

extension Repository.DataTransfer.Receive {
    
    struct Character: Decodable {
        
        let results: [Result]
        
        struct Result: Decodable {
            
            let id: Int?
            let name: String?
            let status: String?
            let species: String?
            let type: String?
            let gender: String?
            let origin: Info?
            let location: Info?
            let image: String?
            let episode: [String]
            let url: String?
            let created: String?
            
            struct Info: Decodable {
                let name: String?
                let url: String?
            }
        }
    }
}
