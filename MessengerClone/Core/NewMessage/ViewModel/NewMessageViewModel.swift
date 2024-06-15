//
//  NewMessageViewModel.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 15.06.2024.
//

import Foundation

class NewMessageViewModel: ObservableObject{
    @Published var users = [User]()
    
    init() {
        Task{try await fetchUsers()}
    }
    
    func fetchUsers() async throws{
        self.users = try await UserService.fetchAllUsers()
    }
}
