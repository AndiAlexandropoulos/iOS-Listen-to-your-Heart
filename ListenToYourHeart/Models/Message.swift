//
//  Message.swift
//  ListenToYourHeart
//
//  Created by andi a on 27.02.23.
//

import Foundation

struct Message: Identifiable, Codable   {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
