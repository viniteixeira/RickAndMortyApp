import Foundation
import Alamofire

// MARK: - EpisodeRepositoryProtocol
public protocol EpisodeRepositoryProtocol {
    func fetchEpisode(_ episodeURL: String, completion: @escaping (Result<Episode.Repository, Error>) -> Void)
}

// MARK: - EpisodeRepository
public class EpisodeRepository: EpisodeRepositoryProtocol {
    
    // MARK: Inits
    public init() {}
    
    // MARK: EpisodeRepositoryProtocol
    public func fetchEpisode(_ episodeURL: String, completion: @escaping (Result<Episode.Repository, Error>) -> Void) {
        let request = AF.request(episodeURL, method: .get)
        request.responseDecodable(of: Episode.Repository.self) { response in
            
            if let error = response.error as Error? {
                completion(.failure(error))
            }

            guard let episode = response.value else {
                completion(.failure(NSError(domain: "An error occurred while fetching episodes.", code: 0)))
                return
            }

            completion(.success(episode))
        }
    }
}
