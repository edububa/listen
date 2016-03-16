//
//  Song.swift
//  playList
//
//  Created by Luis Eduardo Bueso on 23/1/16.
//  Copyright © 2016 Luis Eduardo Bueso. All rights reserved.
//

import Cocoa

class Song: NSObject {
    // src -> variable that contains the directory of the list
    let src: String
    // name -> variable that contains the name of the song
    var name: String
    // position -> variable that contains the position of a song
    var position: Int

    init(src: String, name: String) {
        self.name = name
        if checkSong(src){
            self.src = src
        } else {
            self.src = ""
            print("Error: wrong path")
        }
        self.position = 0
    }

    func checkSong(src: String) -> Bool {
        let result: Bool
        result = true
        return result
    }

    func simpleDescription() -> String {
        return "Track:  \(position)  Name: \(name)"
    }

    func playSong() {
        // Create a Task instance
        let task = NSTask()

        // Set the task parameters
        task.launchPath = "/usr/bin/zsh"
        task.arguments = ["afplay"]

        // Create a Pipe and make the task
        // put all the output there
        let pipe = NSPipe()
        task.standardOutput = pipe

        // Launch the task
        task.launch()
    }
}
