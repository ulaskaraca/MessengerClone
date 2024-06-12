//
//  AuthServices.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 11.06.2024.
//

import Foundation
import FirebaseAuth

struct AuthServices{
    func login(_ email: String, _ password: String){
        if(email != "" && password != ""){
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if(error == nil){
                    print("Log in successful")
                    
                }
                else{
                    print(error as Any)
                }
            }
        }
        
    }
    
    func signUp(_ email: String, _ password: String, _ fullname: String){
        if(email != "" && password != "" && fullname != ""){
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if(error == nil){
                    print("Register successful")
                    
                }else{
                    print(error as Any)
                }
            }
        }
    }
    
    func logout(){
        do{
            try Auth.auth().signOut()
            print("Hesaptan çıkış yapıldı")
        }catch{
            print("Error while trying signout")
        }
    }
    
    
}
