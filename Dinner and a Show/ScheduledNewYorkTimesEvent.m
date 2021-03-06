//
//  ScheduledNewYorkTimesEvent.m
//  Dinner and a Show
//
//  Created by Joe Blough on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScheduledNewYorkTimesEvent.h"
#import "NewYorkTimesEventDetailViewController.h"
#import "AppDelegate.h"
#import "EventInformationParser.h"

@implementation ScheduledNewYorkTimesEvent

@synthesize date = _date;
@synthesize event = _event;
@synthesize reminder = _reminder;
@synthesize minutesBefore = _minutesBefore;
@synthesize checkin = _checkin;
@synthesize checkinMinutes = _checkinMinutes;
@synthesize followUp = _followUp;
@synthesize followUpWhen = _followUpWhen;

- (void)setDate:(NSDate *)date
{
    _date = [EventInformationParser removeSeconds:date];
}

- (void)setFollowUpWhen:(NSDate *)followUpWhen
{
    _followUpWhen = [EventInformationParser removeSeconds:followUpWhen];
}

- (NSString *)eventId
{
    return [NSString stringWithFormat:@"%@ - %@", self.event.identifier, self.date];
}

- (NSDate *)eventDate
{
    return self.date;
}

- (NSString *)eventDescription
{
    return (self.event) ? self.event.name : @"";
}

- (void)deleteEvent
{
    AppDelegate *appDelete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelete.eventLibrary removeNewYorkTimesEvent:self.event when:self.date];
    [appDelete removeNotification:self];
}

- (NSString *)getSegue
{
    return @"NYT Event Selection Segue";
}

- (void)prepSegueDestination:(id)destinationViewController
{
    AppDelegate *appDelete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NewYorkTimesEvent *fullEvent = [appDelete.eventLibrary loadNewYorkTimesEvent:self.event.identifier];
    [(NewYorkTimesEventDetailViewController *)destinationViewController setEvent:fullEvent];
    [(NewYorkTimesEventDetailViewController *)destinationViewController setOriginalEvent:self];
}

@end
