//
//  main.swift
//  iTunes
//
//  Created by Hyunjae Lee on 9/30/16.
//  Copyright © 2016 Hyunjae Lee. All rights reserved.
//

import Foundation
import ScriptingBridge

let iTunes: iTunesApplication = SBApplication(bundleIdentifier: "com.apple.iTunes")!

while(iTunes.playerState == iTunesEPlS.Playing){
    let currentTrack: iTunesTrack? = iTunes.currentTrack!
    let artist = currentTrack?.artist!
    let name = currentTrack?.name!
    let nameEscaped = name?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    let artistEscaped = artist?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    let string = name!+" "+artist!
    let stringEscaped = nameEscaped!+"%20"+artistEscaped!
    print(string)
    if let lyrics = lyricalNonsense(string: stringEscaped) {
        currentTrack?.setLyrics!(lyrics)
        print("done")
    } else {
        print("failed")
    }
    iTunes.nextTrack!()
 }















