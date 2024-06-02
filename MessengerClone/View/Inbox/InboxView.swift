//
//  InboxView.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 2.06.2024.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        
        NavigationStack{
            ScrollView{
                NowActiveView()
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    HStack{
                        Image(systemName: "person.circle.fill")
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(){
                    Button{
                        
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
