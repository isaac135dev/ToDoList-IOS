//
//  ProfileView.swift
//  ToDoList
//
//  Created by avila on 13/07/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                }else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
            
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        
            // Avatar
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color.blue)
                .frame(width: 125, height: 125)
                .padding()
            // info: Name, Email, Member since
            VStack(alignment: .leading) {
                HStack{
                    Text("Name: ")
                        .bold()
                    Text(user.name)

                }
                HStack{
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }
                HStack{
                    Text("Member Since: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")


                }
            }
            .padding()
            // Sign Out
            Button("Log Out") {
                viewModel.logOut()
            }
            .tint(.red)
            .padding()
//                TLButton(title: "Log Out", background: .red) {
//                    viewModel.logOut()
//                }
            Spacer()
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
