//
//  iTunesScript.h
//  iTunes
//
//  Created by Hyunjae Lee on 10/2/16.
//  Copyright © 2016 Hyunjae Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ScriptingBridge/ScriptingBridge.h>
#import "iTunes.h"

@interface iTunesScript : NSObject

@property NSString *artist;
@property NSString *name;
@property NSString *lyrics;

- (BOOL) isPlaying;
- (void) nextTrack;

@end
