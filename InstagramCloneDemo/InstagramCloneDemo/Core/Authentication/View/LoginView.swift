//
//  LoginView.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 10.06.24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                //logo image
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                // text fieelds
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .IGTextFieldStyle()
                    
                    SecureField("Password", text: $password)
                        .IGTextFieldStyle()
                }
                
                Button {
                    print("Show forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 28)
                .padding(.top, 14)
                
                Button {
                    print("Login")
                } label: {
                    Text("Log in")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                .frame(width: 360, height: 44)
                .background(.blue, in: .rect(cornerRadius: 8))
                .padding(.top)
                
                HStack {
                    Rectangle()
                        .frame(width: 150, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: 150, height: 0.5)
                }
                .foregroundStyle(.gray)
                .padding(.top)
                
                HStack {
                    Image(.fblogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                    
                    Button {
                        // action
                    } label: {
                        Text("Continue with Facebook")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.top, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
