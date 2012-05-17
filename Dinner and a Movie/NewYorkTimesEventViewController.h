//
//  NewYorkTimesEventViewController.h
//  Dinner and a Movie
//
//  Created by Joe Blough on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewYorkTimesEvent.h"
#import "AddNewYorkTimesEventToScheduleViewController.h"

@interface NewYorkTimesEventViewController : UITableViewController <AddNewYorkTimesEventDelegate>

@property (nonatomic, strong) NewYorkTimesEvent *event;

@end