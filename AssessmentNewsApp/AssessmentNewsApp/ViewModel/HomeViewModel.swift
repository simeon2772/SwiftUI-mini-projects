//
//  HomeViewModel.swift
//  AssessmentNewsApp
//
//  Created by Simeon Ivanov on 20.09.24.
//

import Foundation
import Observation

@Observable
class HomeViewModel {
    var articles: [Article] = []
    
    var filteredArticles: [Article] {
        guard !searchText.isEmpty else { return articles }
        return articles.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.source.name.localizedCaseInsensitiveContains(searchText)}
    }
    
    var searchText: String = ""
    
    var category: Categories = .general
    var country: Country = .us
    
    let baseURL = "https://newsapi.org/v2/top-headlines"
    var pageSize = 15
    
    func getData(category: Categories) async throws -> [Article] {
        let endpoint = "\(baseURL)?country=\(country.rawValue)&category=\(category.rawValue)&pageSize=\(pageSize)&apiKey=\(apiKey)"
        
        guard let url = URL(string: endpoint) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(Articles.self, from: data)
        print("SUCCESSUFFULLY GETTING DATA")
        print(decodedData.articles.count)
        return decodedData.articles
    }
    
    fileprivate var apiKey: String {
        if let path = Bundle.main.path(forResource: "apiKey", ofType: "plist"),
           let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any] {
            if let apiKey = dictionary["API_KEY"] as? String {
                return apiKey
            } else {
                print("API Key not found in plist.")
            }
        } else {
            print("Plist file not found.")
        }
        
        return ""
    }
}

enum Categories: String, CaseIterable {
    case general, entertainment, technology, science, sports, health, business
}

enum Country: String, CaseIterable {
    case us
//    uk, de, it, fr, es, ca, au, ar, br, bg
}
