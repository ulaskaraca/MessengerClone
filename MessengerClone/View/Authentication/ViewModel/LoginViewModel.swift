//
//  LoginViewModel.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 13.06.2024.
//

import SwiftUI

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signin() async throws{
        try await AuthService.shared.login(email, password)
    }
    
}
