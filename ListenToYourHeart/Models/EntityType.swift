//
//  EntityType.swift
//  ListenToYourHeart
//
//  Created by andi a on 23.03.23.
//

import Foundation

enum EntityType: String, Identifiable, CaseIterable {
    
    case all
    case album
    case song
    case movie
    
    var id: String {
        self.rawValue
    }
    
    func name() -> String {
        switch self {
        case .all:
            return "Alles"
        case .album:
            return "Alben"
        case .song:
            return "Lieder"
        case .movie:
            return "Filme"
        }
    }
}
