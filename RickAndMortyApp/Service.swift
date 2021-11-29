//
//  Services.swift
//  RickAndMortyApp
//
//  Created by Vinicius Teixeira on 29/11/21.
//

import Foundation

class Service {

    // MARK: Properties
    public static var baseURL: String = ""

    // MARK: Methods
    private func getURLPlist() -> String {
        var urlString: String = ""
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: path)
            urlString = (dictionary?.value(forKey: "url") as? String) ?? ""
         }
        return urlString
    }
}
