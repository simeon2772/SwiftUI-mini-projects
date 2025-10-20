//
//  AsyncImageWrapper.swift
//  AssessmentNewsApp
//
//  Created by Simeon Ivanov on 20.09.24.
//

import SwiftUI

struct AsyncImageWrapper: View {
    let urlToImage: String
    var imageWidth: CGFloat = 405
    var imageHeight: CGFloat = 300
    var cornerRadius: CGFloat = 0
    
    var body: some View {
        AsyncImage(url: URL(string: urlToImage)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: imageWidth, height: imageHeight)
                .clipShape(.rect(cornerRadius: cornerRadius))

        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    AsyncImageWrapper(urlToImage: Article.mockArticles[1].urlToImage!)
}
