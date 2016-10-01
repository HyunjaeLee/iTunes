//
//  musixmatchApi.swift
//  iTunes
//
//  Created by Hyunjae Lee on 10/2/16.
//  Copyright © 2016 Hyunjae Lee. All rights reserved.
//

import Foundation

func musixmatch(apikey: String, track: String, artist: String) -> String{ // apikey = "e89c3454c5d6075c7d51f1e69462a0b4"
    let url = URL(string: "http://api.musixmatch.com/ws/1.1/matcher.lyrics.get?apikey=\(apikey)&q_track=\(track)&q_artist=\(artist)")
    let data = try? Data(contentsOf: url!)
    print(url!)
    let json = try? JSONSerialization.jsonObject(with: data!) as! [String: Any]
    let message = json?["message"] as! [String: Any]
    let body = message["body"] as! [String: Any]
    let lyrics = body["lyrics"] as! [String: Any]
    let lyrics_body = lyrics["lyrics_body"] as! String
    /*
     let range = lyrics_body.index(lyrics_body.endIndex, offsetBy: -60)..<lyrics_body.endIndex
     lyrics_body.removeSubrange(range)
     */
    return lyrics_body
}
