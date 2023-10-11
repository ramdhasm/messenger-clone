//
//  ContentViewModel.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-11.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    var cancellable = Set<AnyCancellable>()
    
    init() {
        setupUserSession()
    }
    
    func setupUserSession() {
        AuthService.shared.$userSession
            .receive(on: DispatchQueue.main)
            .sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellable)
    }
    
}
