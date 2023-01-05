import Foundation

struct CharacterDetailTableViewCellViewModel {
    let episode: String
    let name: String
    
    func setupCell(_ cell: CharacterDetailTableViewCell) {
        cell.updateCell(episode: episode, name: name)
    }
}
