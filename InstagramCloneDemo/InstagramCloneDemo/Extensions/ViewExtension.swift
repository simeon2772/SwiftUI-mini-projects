//
//  ViewExtension.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 10.06.24.
//

import SwiftUI

extension View {
    func IGTextFieldStyle() -> some View {
        modifier(IGTextFieldModifier())
    }
}
