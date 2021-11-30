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
            let request = AF.request(Service.baseURL+"character", method: .get)
            request.responseDecodable(of: DataTransfer.Receive.Character.self) { response in
                if let error = response.error as Error? {
                    completion(.failure(error))
                }

                guard let characters = response.value else {
                    // MARK: TODO
                    // Implements failure when response is null
                    return
                }

                completion(.success(characters))
            }
        }
    }
}
