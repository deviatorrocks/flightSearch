//
//  SearchBarView.swift
//  SearchApp
//
//  Created by ZMO-MAC-MandarK-01 on 21/11/23.
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @State var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.blue
            HStack {
                TextField("Enter user name", text: $text)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    .frame(height: 44)
                Button("Search", action: action)
                    .foregroundColor(.black)
            }
            .padding([.trailing, .leading], 16)
        }
        .frame(height: 60)
    }
}
