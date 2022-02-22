//
//  Mock.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 22/02/22.
//

import Foundation

class Mock {

    static func getCharacter(index: Int) -> Model.Character {
        let result = JSONLoader.loadData(forResource: "characters")
        switch result {
        case .success(let data):
            do {
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(Repository.DataTransfer.Receive.Character.self, from: data)
                return jsonData.results[index].toModelCharacter()
            } catch {
                print(error.localizedDescription)
            }
        case .failure:
            print("DEU RUIM")
        }

        return .init()
    }

    static func getCharacters() -> [Model.Character] {
        let result = JSONLoader.loadData(forResource: "characters")
        var characters: [Model.Character] = []
        switch result {
        case .success(let data):
            do {
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(Repository.DataTransfer.Receive.Character.self, from: data)
                characters.append(contentsOf: jsonData.results.map{ $0.toModelCharacter() })
            } catch {
                print(error.localizedDescription)
            }
        case .failure:
            print("DEU RUIM")
        }

        return characters
    }
}
