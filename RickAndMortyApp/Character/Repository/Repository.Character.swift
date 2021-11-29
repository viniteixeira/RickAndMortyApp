//
//  Repository.Character.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 11/11/21.
//

import Alamofire

extension Repository {
    
    class Character {
        
        // MARK: Methods
        func fetchCharacters(completion: @escaping (Result<DataTransfer.Receive.Character, Error>) -> Void) {
            let request = AF.request("https://rickandmortyapi.com/api/character", method: .get)
            request.responseDecodable(of: DataTransfer.Receive.Character.self) { response in
                guard let error = response.error else {
                    return
                }
                
                guard let characters = response.value else {
                    return
                }
                
                completion(.success(characters))
            }
        }
    }
}
