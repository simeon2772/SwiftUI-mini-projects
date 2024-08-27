//
//  AddEmailView.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 10.06.24.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 12) {
            Text("Add your email")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("You'll use this email to sing in to your account.")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
                .IGTextFieldStyle()
            
            NavigationLink {
                CreateUsernameView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .frame(width: 360, height: 44)
            .background(.blue, in: .rect(cornerRadius: 8))
            .padding(.top)

            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddEmailView()
    }
}
