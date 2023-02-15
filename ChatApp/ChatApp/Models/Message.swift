//
//  Message.swift
//  ChatApp
//
//  Created by Максимилиан Мальсагов on 11.02.2023.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
