//
//  iTunesScript.m
//  iTunes
//
//  Created by Hyunjae Lee on 10/2/16.
//  Copyright © 2016 Hyunjae Lee. All rights reserved.
//

#import "iTunesScript.h"

@implementation iTunesScript

iTunesApplication *iTunes;
iTunesTrack *track;
NSString *artist;
NSString *name;
NSString *lyrics;

- (id) init {
    iTunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
    track = [iTunes currentTrack];
    return self;
}

- (BOOL) isPlaying {
    if([iTunes playerState] == iTunesEPlSPlaying) {
        return true;
    } else {
        return false;
    }

}

- (NSString*) artist {
    return [track artist];
}

- (void) setArtist:(NSString *)artist{
    [track setArtist: artist];
}

- (NSString*) name {
    return [track name];
}

- (void) setName:(NSString *)name {
    [track setName: name];
}

- (NSString*) lyrics {
    return [track lyrics];
}

- (void) setLyrics:(NSString*)lyrics {
    [track setLyrics: lyrics];
}

- (void) nextTrack {
    [iTunes nextTrack];
}

@end
