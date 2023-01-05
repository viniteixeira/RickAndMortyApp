import Foundation

struct CharacterListTableViewCellViewModel {
    let character: Character
    
    func setupCell(_ cell: CharacterListTableViewCell) {
        cell.updateCell(character)
    }
}
