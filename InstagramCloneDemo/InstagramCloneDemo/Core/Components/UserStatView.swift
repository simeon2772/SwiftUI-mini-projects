//
//  UserStatView.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 8.06.24.
//

import SwiftUI

struct UserStatView: View {
    var value: Int
    var title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text("\(title)")
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

#Preview {
    UserStatView(value: 3, title: "posts")
}
