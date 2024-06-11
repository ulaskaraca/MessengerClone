//
//  NewMessageView.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 11.06.2024.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            TextField("To:", text: $searchText)
                .frame(height: 44)
                .padding(.leading)
                .background(Color(.systemGroupedBackground))
        }
        .navigationTitle("New Message")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button("Cancel"){
                    dismiss()
                }
                .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    NavigationStack{
        NewMessageView()
    }
}
