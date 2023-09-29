//
//  LoginView.swift
//  Authentication
//
//  Created by Simeon Ivanov on 28.09.23.
//

import SwiftUI

struct LoginView: View {

    @State private var emailAddress = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                //  image/icon
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 190)
                //  form fields
                VStack(spacing: 24) {
                    
                    InputView(text: $emailAddress, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding()
                
                //  sign in button
                
                Button {
                    Task {
                        try await viewModel.singIn(withEmail: emailAddress, password: password)
                    }
                } label: {
                    HStack {
                        Text("SING IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(11)
                .padding(.top, 22)
                
                Spacer()
                //  sing up button
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 16))
                }
            }
        }
    }
}

//MARK: - Authentication protocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !emailAddress.isEmpty && emailAddress.contains("@") && !password.isEmpty && password.count > 5
    }
}

#Preview {
    LoginView()
}
