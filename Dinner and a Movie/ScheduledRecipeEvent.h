//
//  ScheduledRecipeEvent.h
//  Dinner and a Movie
//
//  Created by Joe Blough on 5/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Recipe;

@interface ScheduledRecipeEvent : NSObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) Recipe *recipe;
@property BOOL reminder;
@property int minutesBefore;

@end
