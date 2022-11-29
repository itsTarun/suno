//  Store.swift
//  StreamCast

import Foundation
import Combine

class Store: ObservableObject {

    @Published private(set) var apiState = AppState.Api()

    private var subscriptions = Set<AnyCancellable>()

    private let environment: AppEnvironment

    init(environment: AppEnvironment = AppEnvironment() ) {
        self.environment = environment
    }

    func dispatch(_ action: Action) {
        switch action {
        case .api(let action):
            ApiReducer.execute(action: action, state: apiState, environment: environment) { [weak self] state in
                self?.apiState = state
            }.store(in: &subscriptions)
        }
    }
}
