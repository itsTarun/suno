import Foundation

enum Action {
    enum Api {
        case fetchPodcasts(_ term: String, limit: Int = 10)
        case fetchGenres(_ filename: String)
    }

    case api(_ action: Api)
}
