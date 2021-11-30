//
//  Repository.Episode.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 30/11/21.
//

import Alamofire

extension Repository {

    class Episode {

        // MARK: Methods
        func fetchEpisode(_ episodeURL: String, completion: @escaping (Result<DataTransfer.Receive.Episode, Error>) -> Void) {
            let request = AF.request(episodeURL, method: .get)
            request.responseDecodable(of: DataTransfer.Receive.Episode.self) { response in
                if let error = response.error as Error? {
                    completion(.failure(error))
                }

                guard let episode = response.value else {
                    // MARK: TODO
                    // Implements failure when response is null
                    return
                }

                completion(.success(episode))
            }
        }
    }
}
