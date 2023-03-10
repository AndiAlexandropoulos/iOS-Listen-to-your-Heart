//
//  VideoListViewModel.swift
//  ListenToYourHeart
//
//  Created by andi a on 02.03.23.
//

import Foundation

class VideoListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var videos: [Video] [Video]()
    @Published var state: FetchState = .good
    
    private let service = APIService()
    
    
    
    let limit: Int = 20
    var page: Int = 0
    
    func fetchSongs(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }
        
        state = .isLoading
        
        
        service.fetchVideos(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let results):
                    for video in results.results {
                        self?.videos.append(video)
                    self?.page += 1
                    self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                    print("fetched \(results.resultCount)")
                    
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
        
    }
}
