//
//  FetchState.swift
//  ListenToYourHeart
//
//  Created by andi a on 02.03.23.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
