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

extension Repository.DataTransfer.Receive.Character.Result {

    func toModelCharacter() -> Model.Character {
        return Model.Character(
            id: id ?? 0,
            name: name ?? "",
            status: status ?? "",
            species: species ?? "",
            type: type ?? "",
            gender: gender ?? "",
            origin: .init(name: origin?.name ?? "", url: origin?.url ?? ""),
            location: .init(name: location?.name ?? "", url: location?.url ?? ""),
            image: image ?? "",
            episode: episode,
            url: url ?? "",
            created: created ?? ""
        )
    }
}
