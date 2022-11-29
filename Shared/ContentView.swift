import SwiftUI

struct ContentView: View {

    @StateObject private var store = Store()

    private let term = "technology"

    var body: some View {
        List {
            switch store.apiState.preferredPodcasts[term] {
            case .loading:
                Text("Loading...")
            case .success(let data):
                ForEach(data) { podcast  in
                    Text(podcast.title)
                }
            case .failure:
                Text("Failure")
            case .none:
                Text("Loading...")
            }
        }.onAppear {
            store.dispatch(.api(.fetchPodcasts(term, limit: 10)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
