//
//  CustomEvent.m
//  Dinner and a Show
//
//  Created by Joe Blough on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomEvent.h"
#import "AppDelegate.h"
#import "CustomEventViewController.h"

@implementation CustomEvent
@synthesize name = _name;
@synthesize when = _when;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize reminder = _reminder;
@synthesize minutesBefore = _minutesBefore;
@synthesize followUp = _followUp;

- (NSDate *)eventDate
{
    return self.when;
}

- (NSString *)eventDescription
{
    return self.name;
}

- (void)deleteEvent
{
    AppDelegate *appDelete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelete.eventLibrary removeCustomEvent:self when:self.when];
}

- (NSString *)getSegue
{
    return @"Custom Event Selection Segue";
}

- (void)prepSegueDestination:(id)destinationViewController
{
    AppDelegate *appDelete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    CustomEvent *event = [appDelete.eventLibrary loadCustomEvent:self.name on:self.when];
    [(CustomEventViewController *)destinationViewController setEvent:event];
}

@end
