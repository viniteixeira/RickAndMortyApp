import Foundation

public class Character {

    // MARK: Properties
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Info
    let location: Info
    let image: String
    let episode: [String]
    let url: String
    let created: String

    // MARK: Inits
    init() {
        self.id = 0
        self.name = ""
        self.status = ""
        self.species = ""
        self.type = ""
        self.gender = ""
        self.origin = .init(name: "", url: "")
        self.location = .init(name: "", url: "")
        self.image = ""
        self.episode = []
        self.url = ""
        self.created = ""
    }
    
    init(id: Int, name: String, status: String,
         species: String, type: String, gender: String,
         origin: Character.Info, location: Character.Info,
         image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
        
    // MARK: Structs
    struct Info {
        let name: String
        let url: String
    }
}

// MARK: - Character.Repository
extension Character {
    struct Repository: Decodable {
        let results: [Result]
        
        // MARK: Result
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
            
            // MARK: Info
            struct Info: Decodable {
                let name: String?
                let url: String?
            }
        }
    }
}

// MARK: - Character.Repository.Result
extension Character.Repository.Result {
    func toModelCharacter() -> Character {
        return Character(
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
