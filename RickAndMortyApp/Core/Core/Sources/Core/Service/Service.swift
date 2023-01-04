import Foundation

public class Service {

    // MARK: Properties
    public static var baseURL: String {
        get { getURLPlist() }
    }

    // MARK: Methods
    private static func getURLPlist() -> String {
        var urlString: String = ""
        if let path = Bundle.module.path(forResource: "Services", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: path)
            urlString = (dictionary?.value(forKey: "url") as? String) ?? ""
         }
        return urlString
    }
}
