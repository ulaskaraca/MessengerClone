//
//  InboxView.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 2.06.2024.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @State private var showProfileView = false
    @State private var showChatView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    
    private var user: User?{
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                NowActiveView()
                
                List{
                    ForEach(0 ... 10, id: \.self){message in
                        InboxRowView()
                    }
                    .onTapGesture {
                        showChatView.toggle()
                    }
                
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
                
            }
            .onChange(of: selectedUser, perform: {newValue in
                showChatView = newValue != nil
            })
            .navigationDestination(for: User.self, destination: {user in
                ProfileView()
            })
            .navigationDestination(isPresented: $showChatView, destination: {
                if let user = selectedUser{
                    ChatView(user: user)
                }
            })
            
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    HStack{
                        Button{
                            showProfileView.toggle()
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.black)
                        }.fullScreenCover(isPresented: $showProfileView, content: {
                            ProfileView()
                        })
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(){
                    Button{
                        showNewMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
                
                
                
            }
        }
        
        
        
    }
}

#Preview {
    InboxView()
}
