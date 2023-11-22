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
                viewModel.userAvatarImages[user].map { image in
                    Image(uiImage: image)
                        .frame(width: 54, height: 54)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: 1))
                }
                Text(user.login)
                Spacer()
            }
            .frame(height: 60)
        }
    }
}
