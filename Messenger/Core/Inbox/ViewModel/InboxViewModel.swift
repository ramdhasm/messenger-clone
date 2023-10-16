//
//  InboxViewModel.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-16.
//

import Foundation
import Combine

@MainActor
class InboxViewModel: ObservableObject {
    @Published var currentUser: User!
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getCurrentUser()
    }
    
    func getCurrentUser() {
        UserService.shared.$currentUser.sink { user in
            self.currentUser = user
        }.store(in: &cancellable)
    }
}
