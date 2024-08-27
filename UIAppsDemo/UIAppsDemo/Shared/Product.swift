//
//  Product.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 4.08.24.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let brand: String?
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    var category: String {
        "Romantic"
    }
    
    let recentlyAdded: Bool = {
        return Int.random(in: 1...4) == 1
    }()
    
    static var mock: Product {
        .init(
            id: 123,
            title: "Example Product",
            description: "This is some mock product",
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            brand: "Apple",
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage],
            thumbnail: Constants.randomImage
        )
    }
}


struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
