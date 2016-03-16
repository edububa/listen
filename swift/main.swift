//
//  main.swift
//  playList
//
//  Created by Luis Eduardo Bueso on 23/1/16.
//  Copyright © 2016 Luis Eduardo Bueso. All rights reserved.
//

import Cocoa

if (Process.arguments.count > 2) {
    switch Process.arguments[1] {
    case "-h":
        print("playSwift new arg0 -> creates a new list")
        print("playSwift add [[arg1] arg0] -> adds a song to a list")
        print("playSwift rem [[arg1] arg0] -> removes a song from a list")
        break
    case "new":
        switch Process.arguments.count {
        case 2:
            print("Write the name of the list you want to create: ")
            break
        case 3:
            print("\(Process.arguments[2]) list created")
            break
        default:
            print("Error")
            break
        }
    case "add":
        switch Process.arguments.count {
        case 3:
            print("add elements to list \(Process.arguments[2])")
            print("Which song would you like to add?")
            let response = readLine(stripNewline: true)
            break
        case 4:
            print("added \(Process.arguments[3]) to the list \(Process.arguments[2])")
            break
        default:
            print("Error")
            break
        }
        break
    case "rem":
        switch Process.arguments.count {
        case 3:
            print("Which track would you like to delete?")
            break
        case 4:
            print("remove the track \(Process.arguments[2]) from the list \(Process.arguments[3])")
            break
        default:
            print("Error")
            break
        }
        break
    default:
        print("Error")
        break
    }
}
