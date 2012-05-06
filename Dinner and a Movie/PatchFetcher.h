//
//  PatchFetcher.h
//  Dinner and a Movie
//
//  Created by Joe Blough on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fetcher.h"
#import "PatchEvent.h"

@interface PatchFetcher : NSObject

+ (void)events:(CompletionHandler) onCompletion onError:(ErrorHandler) onError;
+ (void)loadEvent:(PatchEvent *)recipe onCompletion:(CompletionHandler) onCompletion onError:(ErrorHandler) onError;

@end
