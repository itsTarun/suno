import Foundation

struct AppEnvironment {
    let decoder: JSONDecoder
    let api: ApiServiceProtocol

    init(decoder: JSONDecoder = .init(), api: ApiServiceProtocol = ApiService()) {
        self.api = api
        self.decoder = decoder
    }
}
