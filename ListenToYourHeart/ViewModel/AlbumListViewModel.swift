//
//  HeartViewModel.swift
//  ListenToYourHeart
//
//  Created by andi a on 22.02.23.
//

import Foundation
import Combine

// itunes examples
// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=10
// https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo

// Search for Music - Albums

class AlbumListViewModel: ObservableObject {
    
    
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    
    @Published var state: FetchState = .good
    
    let limit: Int = 20
    var page: Int = 0
    
    let service = APIService()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in     // ???
                self?.clear()
                self?.fetchAlbums(for: term)
            }.store(in: &subscriptions)
    }
    
    func clear() {
        state = .good
        albums = []
        page = 0
    }
    
    func loadMore() {
        fetchAlbums(for: searchTerm)
    }
    
    func fetchAlbums(for searchTerm: String) {
        
        // check if i start the fetch request
        guard !searchTerm.isEmpty else {
            return  
        }
        // Don´t start if already loading
        guard state == FetchState.good else {
            return
        }
        
        state = .isLoading
        
        service.fetchAlbums(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    for album in results.results {
                        self?.albums.append(album)
                    }
                    self?.page += 1
                    self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                    print("fetched albums \(results.resultCount)")
                    
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
    
    static func example() -> AlbumListViewModel {
        let vm = AlbumListViewModel()
        vm.albums = [Album.example()]
        return vm
    }
}
 
