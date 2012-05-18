//
//  NewYorkTimesEventsSearchViewController.h
//  Dinner and a Movie
//
//  Created by Joe Blough on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewYorkTimesEventsSearchCriteria.h"

@protocol NewYorkTimesEventsSearchDelegate <NSObject>

- (void)searchNewYorkTimesEvents:(NewYorkTimesEventsSearchCriteria *)newYorkTimesEventCriteria sender:(id)sender;
- (NewYorkTimesEventsSearchCriteria *)getNewYorkTimesEventCriteria;

@end

@interface NewYorkTimesEventsSearchViewController : UIViewController

@property (nonatomic, weak) id<NewYorkTimesEventsSearchDelegate> delegate;

@end
