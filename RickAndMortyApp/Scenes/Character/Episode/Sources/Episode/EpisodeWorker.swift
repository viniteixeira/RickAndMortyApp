import Foundation

// MARK: - EpisodeWorkerProtocol
public protocol EpisodeWorkerProtocol {
    func fetchEpisode(_ episodeURL: String, completion: @escaping(Result<Episode, Error>) -> Void)
}

// MARK: - EpisodeWorker
public class EpisodeWorker {
    
    // MARK: Properties
    private var repository: EpisodeRepositoryProtocol

    // MARK: Inits
    public init(repository: EpisodeRepositoryProtocol = EpisodeRepository()) {
        self.repository = repository
    }
}

// MARK: - EpisodeWorker+EpisodeWorkerProtocol
extension EpisodeWorker: EpisodeWorkerProtocol {
    public func fetchEpisode(_ episodeURL: String, completion: @escaping (Result<Episode, Error>) -> Void) {
        repository.fetchEpisode(episodeURL) { result in
            switch result {
            case .success(let episode):
                completion(.success(episode.toModelEpisode()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
