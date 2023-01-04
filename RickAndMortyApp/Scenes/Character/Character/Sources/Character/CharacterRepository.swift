import Foundation
import Alamofire
import Core

// MARK: - CharacterRepositoryProtocol
protocol CharacterRepositoryProtocol {
    func fetchCharacters(completion: @escaping (Result<Character.Repository, Error>) -> Void)
}

class CharacterRepository: CharacterRepositoryProtocol {
    
    // MARK: CharacterRepositoryProtocol
    func fetchCharacters(completion: @escaping (Result<Character.Repository, Error>) -> Void) {
        let request = AF.request(Service.baseURL+"character", method: .get)
        request.responseDecodable(of: Character.Repository.self) { response in
            if let error = response.error as Error? {
                completion(.failure(error))
            }
            
            guard let characters = response.value else {
                completion(.failure(NSError(domain: "An error occurred while fetching the characters.", code: 0)))
                return
            }

            completion(.success(characters))
        }
    }
}
