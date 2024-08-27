//
//  NetflixMyListButton.swift
//  UIAppsDemo
//
//  Created by Simeon Ivanov on 7.08.24.
//

import SwiftUI

struct NetflixMyListButton: View {
    
    var isInMyList: Bool = false
    var onButtonPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Image(systemName: "checkmark")
                    .opacity(isInMyList ? 1 : 0)
                    .rotationEffect(.degrees(isInMyList ? 0 : 180))
                Image(systemName: "plus")
                    .opacity(isInMyList ? 0 : 1)
                    .rotationEffect(.degrees(isInMyList ? -180 : 0))
            }
            .font(.title)
            
            Text("My List")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .background(.black.opacity(0.001))
        .animation(.bouncy, value: isInMyList)
        .onTapGesture {
            onButtonPressed?()
        }
    }
}

fileprivate struct NetflixMyListButtonPreview: View {
    
    @State private var isMyList: Bool = false
    
    var body: some View {
        NetflixMyListButton(isInMyList: isMyList) {
            isMyList.toggle()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NetflixMyListButtonPreview()
    }
}
