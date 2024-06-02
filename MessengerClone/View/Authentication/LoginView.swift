//
//  LoginView.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 2.06.2024.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State var navigated = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Image("messenger")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                TextField("Enter your email", text: $email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                SecureField("Enter your password", text: $password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                
                Button("Forgot password?"){
                    
                }
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.trailing, 28)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                
                
                
                Button("Login"){
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
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 360, height: 44)
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.vertical)
            
            HStack{
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 2)-40, height: 0.5)
                Text("OR")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 2)-40, height: 0.5)
            }.foregroundColor(.gray)
            
            HStack{
                Image("facebook")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text("Continue with Facebook")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemBlue))
            }
            Spacer()
            
            NavigationLink{
                SignupView()
            } label: {
                HStack{
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }.foregroundColor(.blue).font(.footnote)
            }
            
            
        }
        .padding()
        }
    }
}

#Preview {
    LoginView()
}
