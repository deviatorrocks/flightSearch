//
//  ContentView.swift
//  SearchApp
//
//  Created by ZMO-MAC-MandarK-01 on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var searchUserViewModel = SearchUserViewModel()
    
    var body: some View {
        NavigationView {
            //Color.yellow
            VStack {
                Text("Users")
                    .font(Font.largeTitle)
                    .fontWeight(Font.Weight.heavy)
                SearchBarView(text: $searchUserViewModel.name) {
                    searchUserViewModel.fetchUserList()
                }
                List() {
                    ForEach(searchUserViewModel.userList) { user in
                        SearchUserRow(viewModel: self.searchUserViewModel, user: user)
                            .onAppear {
                                self.searchUserViewModel.fetchAvatarImage(user: user)
                            }
                    }
                }
            }
        }
        .navigationBarTitle(Text("User list"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
