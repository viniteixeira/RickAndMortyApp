import Foundation

// MARK: - Episode
public class Episode {

    // MARK: Properties
    var id: Int = 0
    public var name: String = ""
    public var episode: String = ""

    // MARK: Inits
    init() {}

    init(id: Int, name: String, episode: String) {
        self.id = id
        self.name = name
        self.episode = episode
    }
}

// MARK: - Episode.Repository
public extension Episode {
    struct Repository: Decodable {
        
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

// MARK: - Episode.Repository Methods
extension Episode.Repository {
    func toModelEpisode() -> Episode {
        return Episode(id: id ?? 0, name: name ?? "", episode: episode ?? "")
    }
}
