//
//  LocalEventDetailViewController.h
//  Dinner and a Show
//
//  Created by Joe Blough on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatchEvent.h"
#import "AddLocalEventToScheduleViewController.h"
#import "ScheduledLocalEvent.h"

@interface LocalEventDetailViewController : UIViewController <UIWebViewDelegate, AddLocalEventDelegate>

@property (nonatomic, weak) PatchEvent *event;
@property (nonatomic, weak) ScheduledLocalEvent *originalEvent;

@end
