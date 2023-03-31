//
//  SongsForAlbumListView.swift
//  ListenToYourHeart
//
//  Created by andi a on 29.03.23.
//

import SwiftUI

struct SongsForAlbumListView: View {
    
    @ObservedObject var songsViewModel: SongsForAlbumListViewModel
    let selectedSong: Song?
    
    var body: some View {
        ScrollViewReader { proxy in
            
            ScrollView {
                
                if songsViewModel.state == .isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else if songsViewModel.songs.count > 0 {
                    Group {
                        if #available(iOS 16.0, *) {
                            SongGridView(songs: songsViewModel.songs,
                                         selectedSong: selectedSong)
                        } else {
                            SongStackView(songs: songsViewModel.songs,
                                          selectedSong: selectedSong)
                        }
                    }
                   
                        .onAppear {
                            print("scroll in list with \(songsViewModel.songs.count) songs")
                            proxy.scrollTo(selectedSong?.trackNumber, anchor: .center)
                        }
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct SongGridView: View {

    let songs: [Song]
    let selectedSong: Song?
    
    var body: some View {
        Grid(horizontalSpacing: 20) {
            ForEach(songs) { song in
                GridRow {
                    Text("\(song.trackNumber)")
                        .font(.footnote)
                        .gridColumnAlignment(.trailing)
                    
                    Text(song.trackName)
                        .gridColumnAlignment(.leading)
                    
                    Spacer()
                    Text(formattedDuration(time: song.trackTimeMillis))
                        .font(.footnote)
                    
                    
                    BuySongButton(urlString: song.previewURL, price: song.trackPrice, currency: song.currency)
                }
                .foregroundColor(song == selectedSong ? Color.accentColor : Color(.label))
                .id(song.trackNumber)
                Divider()
            }
        }
        .padding([.vertical, .leading])
    }
}

struct SongStackView: View {
    let songs: [Song]
    let selectedSong: Song?
    
    var body: some View {
        VStack {
            ForEach(songs) { song in
                HStack {
                    Text("\(song.trackNumber)")
                        .font(.footnote)
                        .frame(width: 25, alignment: .trailing)
                    
                    Text(song.trackName)
                        
                    
                    Spacer()
                    Text(formattedDuration(time: song.trackTimeMillis))
                        .font(.footnote)
                    
                    
                    BuySongButton(urlString: song.previewURL, price: song.trackPrice, currency: song.currency)
                        .padding(.trailing)
                }
                .foregroundColor(song == selectedSong ? Color.accentColor : Color(.label))
                .id(song.trackNumber)
                Divider()
            }
        }
       // .padding([.vertical, .leading])
    }
}

fileprivate func formattedDuration(time: Int) -> String {
    
    let timeInSeconds = time / 1000
    
    let interval = TimeInterval(timeInSeconds)
    let formatter = DateComponentsFormatter()
    formatter.zeroFormattingBehavior = .pad
    formatter.allowedUnits = [.minute, .second]
    formatter.unitsStyle = .positional
    
    return formatter.string(from: interval) ?? ""
}

struct SongsForAlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsForAlbumListView(songsViewModel: SongsForAlbumListViewModel.example(), selectedSong: nil)
        
        SongStackView(songs: [Song.example(), Song.example2()], selectedSong: nil)
    }
}
