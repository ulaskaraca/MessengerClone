//
//  AuthServices.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 11.06.2024.
//

import Foundation
import FirebaseAuth



class AuthService{
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser
        print("Debug: User session id is \(userSession?.uid)")
    }
    
    func login(_ email: String, _ password: String) async throws{
        if(email != "" && password != ""){
            do{
                let result = try await Auth.auth().signIn(withEmail: email, password: password)
                self.userSession = result.user
                print("Login successful")
            }catch{
                print("Error while logging in")
            }
        }
    }
    
    func signUp(_ email: String, _ password: String, _ fullname: String) async throws{
        if(email != "" && password != "" && fullname != ""){
            do{
                let result = try await Auth.auth().createUser(withEmail: email, password: password)
                self.userSession = result.user
                print("Signup successful")
            }catch{
                print("Error while signup")
            }
        }
    }
    
    func logout(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            print("Hesaptan çıkış yapıldı")
        }catch{
            print("Error while trying signout")
        }
    }
    
    
}
