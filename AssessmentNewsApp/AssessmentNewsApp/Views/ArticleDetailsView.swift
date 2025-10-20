//
//  ArticleDetailsView.swift
//  AssessmentNewsApp
//
//  Created by Simeon Ivanov on 20.09.24.
//

import SwiftUI

struct ArticleDetailsView: View {
    @Environment(\.openURL) private var openUrl
    let article: Article
    var body: some View {
        VStack {
                if let imageUrl = article.urlToImage {
                    AsyncImageWrapper(urlToImage: imageUrl)
                } else {
                    Image(.defaultNews)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(article.source.name)
                            .padding(.leading)
                            .font(.title2)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 1.5)
                        
                        ScrollView {
                            Text(article.unwrappedContent)
                                .fontWeight(.regular)
                                .multilineTextAlignment(.leading)
                                .lineLimit(5)
                                .padding()
                        }
                        .scrollIndicators(.never)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 8)
                
                Spacer()
            
            ZStack {
                Button("Read More") {
                    guard let url = URL(string: article.url) else { return }
                    openUrl(url)
                }
                .frame(width: 300, height: 50)
                .background(Color(.systemBlue), in: .rect(cornerRadius: 10))
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .font(.title3)
            }
        }
        .navigationTitle(article.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ArticleDetailsView(article: Article.mockArticles[1])
    }
}
