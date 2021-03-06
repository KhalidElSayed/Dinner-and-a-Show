//
//  Restaurant.h
//  Dinner and a Show
//
//  Created by Joe Blough on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestaurantLocation.h"

@interface Restaurant : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *mobileUrl;
@property (nonatomic, strong) NSString *ratingUrl;
@property (nonatomic, strong) NSString *largeRatingUrl;
@property int reviewCount;
@property (nonatomic, strong) NSNumber *price;
@property double rating;
@property (nonatomic, strong) RestaurantLocation *location;

@end
