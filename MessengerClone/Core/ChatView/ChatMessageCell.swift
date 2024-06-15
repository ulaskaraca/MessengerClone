//
//  ChatMessageCell.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 12.06.2024.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
    
    var body: some View {
        HStack{
            if isFromCurrentUser{
                Spacer()
                Text("This is a test message for now. This is a test message for now. This is a test message for now. This is a test message for now")
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemBlue))
                    .foregroundStyle(Color(.white))
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            }else{
                HStack(alignment: .bottom, spacing: 8){
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text("This is a test message for now. This is a test message for now. This is a test message for now")
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray5))
                        .foregroundStyle(Color(.black))
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    Spacer()
                }
            }
            
        }
        .padding(.horizontal, 8)
    }
    
}

#Preview {
    ChatMessageCell(isFromCurrentUser: false)
}
