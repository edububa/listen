
//  List.swift
//  playList
//
//  Created by Luis Eduardo Bueso on 23/1/16.
//  Copyright © 2016 Luis Eduardo Bueso. All rights reserved.
//

import Cocoa

class List: NSObject {
    // name -> name of the list
    var name: String
    // songs -> elements in the list
    var songs: [Song]
    
    init(name: String) {
        self.name = name
        songs = [Song]()
    }
    
    init(name: String, songs: [Song]) {
        self.name  = name
        self.songs = songs
    }
    
    // function that returns the size uf the list
    func size() -> Int { return self.songs.count }
    
    // function that adds a song to the end of the list
    func addSong(song: Song) {
        self.songs.append(song)
        updatePosition()
    }
    
    // function that adds a song in the given position to the list
    func addSong(song: Song, pos: Int) {
        self.songs.insert(song, atIndex: pos - 1)
        updatePosition()
    }
    
    // function that removes a song in the position given
    func deleteSong(pos: Int) {
        if self.songs.isEmpty { print("The list: \(name) is empty") }
        if pos < 1 { self.songs.removeAtIndex(0) }
        if pos > self.songs.count { self.songs.removeAtIndex(self.songs.count - 1) }
        self.songs.removeAtIndex(pos - 1)
        updatePosition()
    }
    
    func simpleDescription() -> String {
        if self.songs.isEmpty { print("Name of the List: \(name) \n EMPTY")}
        var description = "Name of the list: \(name)\n"
        for song in self.songs {
            description += song.simpleDescription() + "\n"
        }
        return description
    }

    func playSong(pos: Int) {
        self.songs[pos - 1]
    }
    
    func playList() {
        for song in songs {
            song.playSong()
        }
    }
    
    // Auxiliar class functions
    // function that adjust the posititon in a list of songs
    func updatePosition () {
        for var index = 0; index < self.songs.count; index++ {
            self.songs[index].position = index + 1
        }
    }
}
