//
//  SwiftUIView.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 12.06.2024.
//

import SwiftUI

struct ChatView: View {
    @State private var field = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 62, height: 62)
                        .foregroundColor(Color(.systemGray4))
                    Text("Heath Ledger")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Messenger")
                        .font(.footnote)
                        .foregroundStyle(Color(.gray))
                }
                
                ForEach(0 ... 15, id: \.self){message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                    
                }
                
            }
            
            ZStack(alignment: .trailing){
                TextField("Message..", text: $field, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                    
                
                Button("Send"){
                    if(field != ""){
                        print(field)
                        field=""
                    }
                }
                .padding(.horizontal)
                .fontWeight(.semibold)
               
            }
            
        
        }
    }
}

#Preview {
    NavigationStack{
        ChatView()
    }
}
