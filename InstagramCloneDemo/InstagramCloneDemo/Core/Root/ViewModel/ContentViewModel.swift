//
//  ContentViewModel.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 11.06.24.
//

import Foundation
import Firebase
import Observation
import Combine

@Observable
class ContentViewModel {
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    var userSession: FirebaseAuth.User?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
