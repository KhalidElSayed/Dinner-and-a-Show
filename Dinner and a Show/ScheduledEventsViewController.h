//
//  ScheduledEventsViewController.h
//  Dinner and a Show
//
//  Created by Joe Blough on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"

@interface ScheduledEventsViewController : UITableViewController

- (void)handleLocalNotification:(UILocalNotification *)notification;

@end
