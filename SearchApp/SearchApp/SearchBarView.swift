//
//  SearchBarView.swift
//  SearchApp
//
//  Created by ZMO-MAC-MandarK-01 on 21/11/23.
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    @Binding private var text: String
    //@State private var text: String = ""
    @State private var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.blue
            HStack {
                TextField("Enter user name", text: $text)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    .frame(height: 50)
                Button("Search", action: action)
                    .foregroundColor(.yellow)
            }
            .frame(height: 50)
            .padding([.trailing, .leading], 16)
        }
        .frame(height: 50)
    }
}
