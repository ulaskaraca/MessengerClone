//
//  SignUpViewModel.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 13.06.2024.
//

import SwiftUI

class SignUpViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws{
        try await AuthService.shared.signUp(email, password, fullname)
    }
    
}
