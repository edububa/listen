#!/usr/bin/env swift
import Foundation
class Song {
    // src -> variable that contains the directory of the list
    var src: String
    // name -> variable that contains the name of the song
    var name: String
    // position -> variable that contains the position of a song
    var position: Int {
        get { return self.position }
        set(newPosition) { self.position = newPosition }
    }
    
    init(src: String, name: String) {
        self.src  = src
        self.name = name
        position  = 0
    }
    
    func simpleDescription() -> String {
        return "Track:  \(position)  Name: \(name)/n"
    }
}

class List {
    // name -> name of the list
    var name: String
    // songs -> elements in the list
    var songs: [Song]
    
    init(name: String) {
        self.name  = name
        self.songs = [Song]()
    }
    
    func addSong(song: Song) {}
    
    func deleteSong(song: String?, pos: Int?) {}
    
    func simpleDescription() -> String {
        var description = "Name of the list: \(name)/n"
        for song in songs {
            description += song.simpleDescription()
        }
        return description
    }
}

// Start of script
var s01 = Song(src: "H1CD1", name: "01..mp3")

print(s01.simpleDescription())
 
