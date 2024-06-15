//
//  ProfileView.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 11.06.2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = InboxViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color(.systemGray4))
                    Text(viewModel.currentUser?.fullname ?? "Anonymus")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                
                List{
                    Section{
                        ForEach(SettingsViewModel.allCases){option in
                            HStack{
                                Image(systemName: option.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(option.color)
                                Text(option.title)
                                    .font(.subheadline)
                            }
                        }
                    }
                    Section{
                        Button("Log Out"){
                            AuthService.shared.logout()
                        }
                        Button("Delete Account"){
                            
                        }
                    }.foregroundColor(.red)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    } label:{
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(.systemGray))
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
    
}
