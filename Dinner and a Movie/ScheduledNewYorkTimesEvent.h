//
//  ScheduledNewYorkTimesEvent.h
//  Dinner and a Movie
//
//  Created by Joe Blough on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScheduledEventitem.h"
#import "NewYorkTimesEvent.h"

@interface ScheduledNewYorkTimesEvent : NSObject <ScheduledEventitem>

@property (nonatomic, strong) NSDate * date;
@property (nonatomic, strong) NewYorkTimesEvent *event;
@property BOOL reminder;
@property int minutesBefore;
@property BOOL followUp;

@end
