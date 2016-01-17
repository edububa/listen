#!/usr/bin/env swift
import Foundation
class Song {
    // src -> variable that contains the directory of the list
    let src: String
    // name -> variable that contains the name of the song
    let name: String
    // position -> variable that contains the position of a song
    var position: Int
    
    init(src: String, name: String) {
        self.src  = src
        self.name = name
        position  = 0
    }
    
    func simpleDescription() -> String {
        return "Track:  \(position)  Name: \(name)\n"
    }
}

class List {
    // name -> name of the list
    var name: String
    // songs -> elements in the list
    var songs: [Song]
    
    init(name: String, songs: [Song]) {
        self.name  = name
        self.songs = songs
    }
    
    func addSong(song: Song) {
        let aux = [song]
        self.songs += aux
    }

    func addSong(song: Song, pos: Int) {}
    
    func deleteSong(song: String?, pos: Int?) {}
    
    func simpleDescription() -> String {
        var description = "Name of the list: \(name)\n"
        for song in self.songs {
            description += song.simpleDescription()
        }
        return description
    }
}

// Start of script
let s01 = Song(src: "H1CD1", name: "01..mp3")
let s02 = Song(src: "H1CD1", name: "02..mp3")
let s03 = Song(src: "H1CD1", name: "03..mp3")
let s04 = Song(src: "H1CD1", name: "04..mp3")

var U1 = List(name: "U1", songs: [s01, s02, s03])
print(s01.simpleDescription())
print(U1.simpleDescription())
U1.addSong(s04)
print(U1.simpleDescription())
