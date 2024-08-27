//
//  User.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 4.08.24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let height, weight: Double
    
    var images: [String] {
        ["https://picsum.photos/1200/1200", "https://picsum.photos/1100/1100", "https://picsum.photos/1300/1300"]
    }
    
    var work: String {
        "Worker at some job"
    }
    
    var education: String {
        "Graduate Degree"
    }
    
    var aboutMe: String {
        "This is a sententence about me that will look good on my profile"
    }
    
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: education),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.stars.fill", emoji: nil, text: "Virgo")
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "🏃", text: "Running"),
            UserInterest(iconName: nil, emoji: "🏋️", text: "Gym"),
            UserInterest(iconName: nil, emoji: "🎧", text: "Music"),
            UserInterest(iconName: nil, emoji: "🥘", text: "Cooking")
        ]
    }
    
    static var mock: User {
        .init(
            id: 12345,
            firstName: "Jane",
            lastName: "Doe",
            maidenName: "Smith",
            age: 32,
            email: "janedoe@example.com",
            phone: "+1234567890",
            username: "janedoe123",
            password: "password123",
            birthDate: "1992-04-15",
            image: Constants.randomImage,
            height: 1.65,
            weight: 62.0
        )
    }
}
