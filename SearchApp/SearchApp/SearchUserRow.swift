//
//  SearchUserRow.swift
//  SearchApp
//
//  Created by ZMO-MAC-MandarK-01 on 22/11/23.
//

import Foundation
import SwiftUI

struct SearchUserRow: View {
    @ObservedObject var viewModel: SearchUserViewModel
    @State var user: User
    
    var body: some View {
        ZStack {
            HStack {
                Color.yellow
                Text(user.login).font(Font.system(size: 18).bold())
                Text("\(user.id)").font(Font.system(size: 18).bold())
                Spacer()
                //let _ = print("Coming here.....\(user.login)  \(user.id)")
            }
            .frame(height: 60)
        }
    }
    
    func printValue() {
        print("Coming here.....")
    }
}
