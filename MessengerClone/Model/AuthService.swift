//
//  AuthServices.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 11.06.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift



class AuthService{
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
        print("Debug: User session id is \(userSession?.uid)")
    }
    
    @MainActor
    func login(_ email: String, _ password: String) async throws{
        if(email != "" && password != ""){
            do{
                let result = try await Auth.auth().signIn(withEmail: email, password: password)
                self.userSession = result.user
                loadCurrentUserData()
                print("Login successful")
            }catch{
                print("Error while logging in")
            }
        }
    }
    
    @MainActor
    func signUp(_ email: String, _ password: String, _ fullname: String) async throws{
        if(email != "" && password != "" && fullname != ""){
            do{
                let result = try await Auth.auth().createUser(withEmail: email, password: password)
                self.userSession = result.user
                try await self.uploadUserData(fullname: fullname, email: email, id: result.user.uid)
                loadCurrentUserData()
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
            UserService.shared.currentUser = nil
            print("Hesaptan çıkış yapıldı")
        }catch{
            print("Error while trying signout")
        }
    }
    
    @MainActor
    private func uploadUserData(fullname: String, email: String, id: String) async throws{
        let user = User(fullname: fullname, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    private func loadCurrentUserData(){
        Task{try await UserService.shared.fetchCurrentUser()}
    }
    
    
}
