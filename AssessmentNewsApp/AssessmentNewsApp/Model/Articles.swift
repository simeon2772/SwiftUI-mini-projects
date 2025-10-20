//
//  Articles.swift
//  AssessmentNewsApp
//
//  Created by Simeon Ivanov on 20.09.24.
//

import Foundation

struct Articles: Codable {
    //    let status: String
    //    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    
//    var id: String {
//        if let sourceId = source.id {
//            return sourceId
//        } else {
//            return UUID().uuidString
//        }
//    }
    
    var id: String {
        UUID().uuidString
    }
    
    var unwrappedAuthor: String {
        author ?? ""
    }
    
    var unwrappedDescription: String {
        description ?? ""
    }
    
    var unwrappedContent: String {
        content ?? ""
    }
    
    var formattedPublishingDate: String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime]
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        if let date = dateFormatter.date(from: publishedAt) {
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            formatter.locale = Locale(identifier: "en_US")
            return formatter.localizedString(for: date, relativeTo: Date())
        } else {
            return "Invalid date"
        }
    }
}

struct Source: Codable {
    let id: String?
    let name: String
}


extension Article {
    static var mockArticles: [Article] {
        [
            Article(
                source: Source(id: "1", name: "News Today"),
                author: "Alice Johnson",
                title: "Local Park Gets New Playground Equipment",
                description: "The community park has been updated with new swings and slides for children.",
                url: "https://example.com/local-park-playground",
                urlToImage: "https://media.architecturaldigest.com/photos/62670cf1a841e371198e0b28/1:1/w_2001,h_2001,c_limit/GettyImages-1347979016.jpg",
                publishedAt: "2024-09-19T12:00:01Z",
                content: "The local park has just received a much-needed update with new playground equipment, making it a more enjoyable place for families."
            ),
            Article(
                source: Source(id: "2", name: "Sports Central"),
                author: "Bob Lee",
                title: "High School Team Wins State Championship",
                description: "The high school basketball team secured a state championship with a thrilling final game.",
                url: "https://example.com/high-school-championship",
                urlToImage: "https://images.unsplash.com/photo-1461897104016-0b3b00cc81ee?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                publishedAt: "2023-08-22T14:45:00Z",
                content: "In a dramatic finale, the high school basketball team won the state championship, celebrating a hard-fought victory."
            ),
            Article(
                source: Source(id: "3", name: "Tech Weekly"),
                author: "Carol Martinez",
                title: "New Smartphone Model Released",
                description: "The latest smartphone model has hit the shelves with improved features and performance.",
                url: "https://example.com/new-smartphone-release",
                urlToImage: nil,
                publishedAt: "2023-07-15T11:20:00Z",
                content: "The new smartphone model, featuring a faster processor and enhanced camera, has been released and is now available for purchase."
            ),
            Article(
                source: Source(id: "4", name: "Travel Buzz"),
                author: "David Kim",
                title: "Top 10 Travel Destinations for 2025",
                description: "Explore the top travel destinations to visit in the upcoming year, from beaches to mountains.",
                url: "https://example.com/top-travel-destinations",
                urlToImage: "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?q=80&w=2021&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                publishedAt: "2023-06-01T09:10:00Z",
                content: "Looking ahead to 2025, these are the top travel destinations that offer beautiful scenery and exciting experiences."
            ),
            Article(
                source: Source(id: "5", name: "Health Daily"),
                author: "Emily Clark",
                title: "Tips for a Healthier Lifestyle",
                description: "Simple tips to improve your daily routine and overall health.",
                url: "https://example.com/health-tips",
                urlToImage: "https://images.unsplash.com/photo-1494597564530-871f2b93ac55?q=80&w=2013&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                publishedAt: "2023-05-18T16:00:00Z",
                content: "Incorporate these easy-to-follow tips into your daily routine to boost your health and well-being."
            )
        ]
    }
}
