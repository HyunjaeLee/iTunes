//
//  main.swift
//  iTunes
//
//  Created by Hyunjae Lee on 9/30/16.
//  Copyright © 2016 Hyunjae Lee. All rights reserved.
//

import Foundation

var iTunes = iTunesScript();

while(iTunes.isPlaying()){
    
    let artist = iTunes.artist
    let name = iTunes.name
    let string = name!+" "+artist!
    let stringEscaped = string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    
    print(string)
    
    if let lyrics = lyricalNonsense(string: stringEscaped) {
        
        iTunes.lyrics = lyrics
        print("done")
        
    } else {
        
        print("failed")
        
    }
    
    iTunes.nextTrack()
    
}















