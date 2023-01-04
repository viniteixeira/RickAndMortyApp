import Foundation

class Character {

    // MARK: Properties
    let id: Int = 0
    let name: String = ""
    let status: String = ""
    let species: String = ""
    let type: String = ""
    let gender: String = ""
    let origin: Info = .init(name: "", url: "")
    let location: Info = .init(name: "", url: "")
    let image: String = ""
    let episode: [String] = ""
    let url: String = ""
    let created: String = ""
//        var episodes: [Model.Episode] = []

    // MARK: Inits
    init(id: Int, name: String, status: String,
         species: String, type: String, gender: String,
         origin: Model.Character.Info, location: Model.Character.Info,
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
