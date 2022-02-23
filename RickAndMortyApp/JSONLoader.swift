//
//  JSONLoader.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 22/02/22.
//

import Foundation

class JSONLoader {
    public static func loadData(forResource resource: String) -> Swift.Result<Data, Error> {
        do {
            let path = getPath(for: resource)
            let data = try Data(contentsOf: URL(fileURLWithPath: path ?? ""), options: .mappedIfSafe)
            return .success(data)
        } catch let error {
            return .failure(error)
        }
    }

    public static func getPath(for resource: String) -> String? {
        let bundle = Bundle(for: self)
        return bundle.path(forResource: resource, ofType: "json")
    }
}
