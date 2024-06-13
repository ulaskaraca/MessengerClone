//
//  ContentViewModel.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 13.06.2024.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
