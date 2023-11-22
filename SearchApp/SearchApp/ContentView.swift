//
//  ContentView.swift
//  SearchApp
//
//  Created by ZMO-MAC-MandarK-01 on 21/11/23.
//

import SwiftUI

struct ContentView: View {
   // @Binding private var text: String = ""
    
    @ObservedObject var searchUserViewModel = SearchUserViewModel()
    
    var body: some View {
        NavigationView {
            //Color.yellow
            VStack {
                Color.yellow
                Text("Users")
                    .font(Font.largeTitle)
                    .fontWeight(Font.Weight.heavy)
                
            }
            .frame(width: 400, height: 100, alignment: Alignment.top)
        }
        .navigationBarTitle(Text("User list"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //SearchBarView()
    }
}
