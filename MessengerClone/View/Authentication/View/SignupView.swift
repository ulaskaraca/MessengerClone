//
//  SignupView.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 2.06.2024.
//

import SwiftUI
import Firebase

struct SignupView: View {
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Spacer()
            Image("messenger")
                .resizable()
                .scaledToFit()
                .padding(.bottom)
                .frame(width: 200, height: 200)
                .padding()
            
            TextField("Enter your email", text:$viewModel.email)
                .font(.subheadline)
                .padding(12)
                .textInputAutocapitalization(.never)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
            
            TextField("Enter your full name", text:$viewModel.fullname)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
            
            SecureField("Enter your password", text:$viewModel.password)
                .font(.subheadline)
                .padding(12)
                .textInputAutocapitalization(.never)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
            
            Button("Sign Up"){
                Task{try await viewModel.createUser()}
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 360, height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.vertical)
            
            Spacer()
            Divider()
            
            Button{
                dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }.foregroundColor(.blue).font(.footnote)
            }
            
            
        }
    }
}

#Preview {
    SignupView()
}
