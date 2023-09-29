//
//  RegistrationView.swift
//  Authentication
//
//  Created by Simeon Ivanov on 28.09.23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var emailAddress = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("icon")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 190)
            
            VStack(spacing: 24) {
                
                InputView(text: $emailAddress, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)
                
                InputView(text: $fullName, title: "Full Name", placeholder: "Enter your name")
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                
                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
            }
            .padding()
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: emailAddress, password: password, fullName: fullName)
                }
            } label: {
                HStack {
                    Text("SING UP")
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
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 16))
            }
        }
    }
}

//MARK: - Authentication protocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !emailAddress.isEmpty && emailAddress.contains("@") && !password.isEmpty && password.count > 5 && !fullName.isEmpty && confirmPassword == password
    }
}

#Preview {
    RegistrationView()
}
