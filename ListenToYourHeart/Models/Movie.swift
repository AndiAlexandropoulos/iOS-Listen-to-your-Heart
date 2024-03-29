//
//  Movie.swift
//  ListenToYourHeart
//
//  Created by andi a on 22.03.23.
//

import Foundation

// MARK: - MovieResult
struct MovieResult: Codable {
    let resultCount: Int
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable, Identifiable {
    let wrapperType, kind: String
    let artistID: Int?
    let trackID: Int
    let artistName, trackName, trackCensoredName: String
    let artistViewURL: String?
    let trackViewURL: String
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice: Double?
    let trackPrice: Double?
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String
    let collectionExplicitness, trackExplicitness: String
    let trackTimeMillis: Int?
    let country, currency, primaryGenreName, contentAdvisoryRating: String
    let shortDescription: String?
    let longDescription: String?
    
    var id: Int {
        return trackID
    }

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription
    }
    
    static func example() -> Movie {
        Movie(wrapperType: "track", kind: "feature-movie", artistID: 1, trackID: 2, artistName: "Jack Johnson", trackName: "All at Once: On the Road Tour Documentary", trackCensoredName: "", artistViewURL: nil, trackViewURL: "", previewURL: nil, artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Video3/v4/80/1d/47/801d4725-5070-1e2a-ab32-dbb240ee8390/UMG_vidcvr_00602547849786_01_RGB72_1400x2100_16UMGIM10177.jpg/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Video3/v4/80/1d/47/801d4725-5070-1e2a-ab32-dbb240ee8390/UMG_vidcvr_00602547849786_01_RGB72_1400x2100_16UMGIM10177.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video3/v4/80/1d/47/801d4725-5070-1e2a-ab32-dbb240ee8390/UMG_vidcvr_00602547849786_01_RGB72_1400x2100_16UMGIM10177.jpg/100x100bb.jpg", collectionPrice: 7.99, trackPrice: 7.99, trackRentalPrice: 3.99, collectionHDPrice: nil, trackHDPrice: nil, trackHDRentalPrice: nil, releaseDate: "2006-04-08t07:00:00Z", collectionExplicitness: "", trackExplicitness: "", trackTimeMillis: 2472388, country: "USA", currency: "USD", primaryGenreName: "Concert Films", contentAdvisoryRating: "", shortDescription: "This film takes an intimate look at Jack Johnson´s music and tour greening initiatives.", longDescription: "This film takes an intimate look at Jack Johnson´s music and tour greening initiatives. When Jack goes on the road, he doesn´t just show up and play music.The tour partners with local non-profits, local food vendors and strives to leave a lasting positive impact.")
    }
}
