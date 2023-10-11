//
//  LoginView.swift
//  ToDoList
//
//  Created by avila on 13/07/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                
                // Login From
               
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log In",
                        background: .blue) {
                      // Attempt log in
                            viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                // Create Acount
                VStack{
                    Text("New around here?")
                    NavigationLink("create acount", destination: RegisterView())
                }
                .padding(.bottom, 50)
                 
                Spacer()
            }
            .padding()
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
