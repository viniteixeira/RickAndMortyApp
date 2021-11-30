//
//  DataTransfer.Receive.Episode.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 30/11/21.
//

extension Repository.DataTransfer.Receive {

    struct Episode: Decodable {

        // MARK: Properties
        let id: Int?
        let name: String?
        let airDate: String?
        let episode: String?
        let characters: [String]

        // MARK: CodingKeys
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case airDate = "air_date"
            case episode
            case characters
        }
    }
}

extension Repository.DataTransfer.Receive.Episode {

    func toModelEpisode() -> Model.Episode {
        return Model.Episode(id: id ?? 0, name: name ?? "", episode: episode ?? "")
    }
}
