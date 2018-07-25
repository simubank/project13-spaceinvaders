import Foundation

extension Data {
    static func json(named name: String) -> Data {
        // Provided you have a file named accounts.json in your bundle.
        guard let url = Bundle.main.url(forResource: name, withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return Data()
        }
        return data
    }
}
