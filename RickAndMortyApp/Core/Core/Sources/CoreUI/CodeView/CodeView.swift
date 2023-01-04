import Foundation

public protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupConfigs()
}

public extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupConfigs()
    }
}
