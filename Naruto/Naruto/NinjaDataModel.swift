//
//  NinjaDataModel.swift
//  Naruto
//
//  Created by Simeon Ivanov on 28.09.23.
//

import Foundation
import SwiftUI

@Observable final class NinjaDataModel {
    var ninjas: [Ninja] = []
    
    init() {
        if let url = Bundle.main.url(forResource: "ninjas", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.ninjas = try decoder.decode([Ninja].self, from: data)
            } catch {
                print("The following error occured \(error.localizedDescription)")
            }
        }
    }
}
