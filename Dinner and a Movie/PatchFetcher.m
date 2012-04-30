//
//  PatchFetcher.m
//  Dinner and a Movie
//
//  Created by Joe Blough on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PatchFetcher.h"
#import "PatchStory+Json.h"
#import "ApiKeys.h"
#import "MD5.h"
#import "AppDelegate.h"

NSString * const BASE_URL = @"http://news-api.patch.com/v1.1";

@implementation PatchFetcher

// story fetching
+ (void)request:(NSString *)relativePath onCompletion:(CompletionHandler) onCompletion onError:(ErrorHandler) onError
{
    dispatch_queue_t queue= dispatch_queue_create("com.josephblough.dinner.patchfetcher", nil);
    
    dispatch_async(queue, ^{
        NSURL *url = [self sign:relativePath];
        //NSLog(@"Requesting %@", url);

        NSData *jsonData = [[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        
        NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData 
                                                                           options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves 
                                                                             error:&error] : nil;
        if (error) {
            NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
            onError(error);   
        }
        else {
            onCompletion(results);
        }
    });
    dispatch_release(queue);
}

+ (NSURL *)sign:(NSString *)relativePath {
    long time = (long)[[NSDate date] timeIntervalSince1970];
    NSString* sig = [MD5 md5hex:[NSString stringWithFormat:@"%@%@%d", kPatchKey, kPatchSecret, time]];
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?format=event-listings&dev_key=%@&sig=%@", BASE_URL, relativePath, kPatchKey, sig]];
}

+ (void)events:(CompletionHandler) onCompletion onError:(ErrorHandler) onError
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.userSpecifiedCode = @"48130";
    NSString *zipCode = (appDelegate.userSpecifiedCode) ? appDelegate.userSpecifiedCode : appDelegate.zipCode;
    [PatchFetcher request:[NSString stringWithFormat:@"/zipcodes/%@/stories", zipCode] onCompletion:^(NSDictionary *data) {
        NSMutableArray *events = [NSMutableArray array];
        
        NSArray *jsonEvents = [data objectForKey:@"stories"];
        [jsonEvents enumerateObjectsUsingBlock:^(NSDictionary *story, NSUInteger idx, BOOL *stop) {
            [events addObject:[PatchStory storyFromJson:story]];
        }];
        onCompletion(events);
    } onError:^(NSError *error) {
        onError(error);
    }];
}

+ (void)loadEvent:(PatchStory *)recipe onCompletion:(CompletionHandler) onCompletion onError:(ErrorHandler) onError
{
    
}

@end
