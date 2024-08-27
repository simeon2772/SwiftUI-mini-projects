//
//  NetflixDetailsHeaderView.swift
//  UIAppsDemo
//
//  Created by Simeon Ivanov on 7.08.24.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsHeaderView: View {
    
    var imageName: String = Constants.randomImage
    var progress: Double = 0.2
    var onAirPlayPressed: (() -> Void)? = nil
    var onXmarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            CustomProgressBar(selection: progress, range: 0...1, backgroundColor: .netflixLightGray, foregroundColor: .netflixRed, cornerRadius: 2 ,height: 4)
                .padding(.bottom, 4)
                .animation(.linear, value: progress)
        }
        .overlay(alignment: .topTrailing) {
            HStack(spacing: 6) {
                Image(systemName: "airplayvideo")
                    .padding(8)
                    .imageScale(.small)
                    .offset(y: 1)
                    .background(.netflixDarkGray, in: .circle)
                    .onTapGesture {
                        onAirPlayPressed?()
                    }
                
                Image(systemName: "xmark")
                    .padding(6)
                    .background(.netflixDarkGray, in: .circle)
                    .onTapGesture {
                        onXmarkPressed?()
                    }
            }
            .padding(8)
            .font(.title2)
            .fontWeight(.medium)
            .foregroundStyle(.netflixWhite)
        }
        .aspectRatio(2, contentMode: .fit)
        .clipShape(.rect(cornerRadii: .init(topLeading: 10, topTrailing: 10)))
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
        VStack {
            NetflixDetailsHeaderView()
            NetflixDetailsHeaderView(progress: 0.6)
            NetflixDetailsHeaderView(progress: 0.9)
        }
    }
}
