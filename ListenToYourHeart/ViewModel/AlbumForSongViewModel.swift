//
//  AlbumForSongViewModel.swift
//  ListenToYourHeart
//
//  Created by andi a on 30.03.23.
//

import Foundation

class AlbumForSongViewModel: ObservableObject {
    
    @Published var album: Album? = nil
    @Published var state: FetchState = .good
    
    let service = APIService()
    
    func fetch(song: Song) {
        
        let albumID = song.collectionID
        
        service.fetchAlbum(for: albumID) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    
                    let albums = results.results
                    
                    self?.album = albums.first
                    self?.state = .good
                    print("successfully fetched \(results.resultCount) songs for albumID: \(albumID)")
                    
                case .failure(let error):
                    print("error when fetching album with id for song: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
