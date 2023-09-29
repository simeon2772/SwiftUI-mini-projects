//
//  SingInButton.swift
//  Authentication
//
//  Created by Simeon Ivanov on 28.09.23.
//

import SwiftUI

struct SingInButton: View {
    var isSingIn: Bool
    
    var body: some View {
        Button {
            print("Log user in..")
        } label: {
            HStack {
                Text(isSingIn ? "SING IN" : "SING UP")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundStyle(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color(.systemBlue))
        .cornerRadius(11)
        .padding(.top, 22)
    }
}

#Preview {
    SingInButton(isSingIn: true)
}
