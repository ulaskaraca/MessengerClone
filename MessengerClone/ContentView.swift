//
//  ContentView.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 2.06.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = AuthService()
    
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                InboxView()
            }
            else{
                LoginView()
            }
        }
    }
}
#Preview {
    ContentView()
}
