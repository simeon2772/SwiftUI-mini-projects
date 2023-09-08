//
//  Location.swift
//  BucketList
//
//  Created by Simeon Ivanov on 8.09.23.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    let latitute: Double
    let longitute: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitute, longitude: longitute)
    }
    
    static let example = Location(id: UUID(), name: "some location", description: "some description", latitute: 51.501, longitute: -0.141)
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}


