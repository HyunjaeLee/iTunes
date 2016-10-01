//
//  lyricalNonsense.swift
//  iTunes
//
//  Created by Hyunjae Lee on 10/2/16.
//  Copyright © 2016 Hyunjae Lee. All rights reserved.
//

import Foundation

func google(string: String) -> URL? {
    var result : URL? = nil
    let url = URL(string: "http://cse.google.com/cse?cx=partner-pub-7926165986285274:9574019542&q=\(string)")
    let html = try? String(contentsOf: url!)
    let types: NSTextCheckingResult.CheckingType = .link
    let detector = try? NSDataDetector(types: types.rawValue)
    let matches = detector!.matches(in: html!, range: NSMakeRange(0, html!.characters.count))
    for match in matches {
        if("\(match)".contains("http://www.lyrical-nonsense.com/lyrics/")){
            result = match.url
        }
    }
    return result
}

func lyricalNonsense(string: String) -> String? {
    let url = google(string: string)
    if(url==nil){ return nil }
    let html: String? = try? String(contentsOf: url!)
    var separator: String
    if(html!.contains("<div class=\"content\" id=\"Lyrics\">")){
        separator = "<div class=\"content\" id=\"Lyrics\">"
    } else if (html!.contains("<div class=\"content\" id=\"Japanese\">")){
        separator = "<div class=\"content\" id=\"Japanese\">"
    } else {
        return nil;
    }
    var htmlArray = html!.components(separatedBy: separator)
    htmlArray = htmlArray[1].components(separatedBy: "<")
    return htmlArray[0]
}
