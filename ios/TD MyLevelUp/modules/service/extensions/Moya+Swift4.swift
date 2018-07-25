import Foundation
import Moya

public extension Response {
    public func mapObject<HttpModel: Codable>(_: HttpModel.Type) -> HttpModel? {
        do {
            return try JSONDecoder().decode(HttpModel.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}
