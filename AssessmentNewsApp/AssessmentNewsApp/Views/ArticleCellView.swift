//
//  ArticleCellView.swift
//  AssessmentNewsApp
//
//  Created by Simeon Ivanov on 20.09.24.
//

import SwiftUI

struct ArticleCellView: View {
    let article: Article
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.source.name)
                    .font(.headline)
                    .fontDesign(.serif)
                
                Text(article.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                HStack {
                    Text(article.unwrappedAuthor)
                        .lineLimit(1)
                    Rectangle()
                        .frame(width: 5, height: 5)
                    Text(article.formattedPublishingDate)
                }
                .foregroundStyle(.secondary)
                .font(.caption)

            }
            
            Spacer()
            
            if let imageUrl = article.urlToImage {
                AsyncImageWrapper(urlToImage: imageUrl, imageWidth: 70, imageHeight: 70, cornerRadius: 10)
            } else {
                Image(.defaultNews)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
        .padding()
    }
}

#Preview {
    ArticleCellView(article: Article.mockArticles[2])
    ArticleCellView(article: Article.mockArticles[0])
    ArticleCellView(article: Article.mockArticles[1])
}
