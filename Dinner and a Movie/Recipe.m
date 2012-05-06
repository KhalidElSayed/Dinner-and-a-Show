//
//  Recipe.m
//  Dinner and a Movie
//
//  Created by Joe Blough on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

@synthesize kind = _kind;
@synthesize url = _url;
@synthesize name = _name;
@synthesize identifier = _identifier;
@synthesize imageUrl = _imageUrl;
@synthesize thumbnailUrl = _thumbnailUrl;
@synthesize cuisine = _cuisine;
@synthesize cookingMethod = _cookingMethod;
@synthesize serves = _serves;
@synthesize yields = _yields;
@synthesize cost = _cost;
@synthesize ingredients = _ingredients;
@synthesize directions = _directions;
@synthesize nutritionalInfo = _nutritionalInfo;

- (void)addDirectionObject:(RecipeDirection *)direction
{
    if (!self.directions) self.directions = [[NSMutableArray alloc] init];
    [(NSMutableArray *)self.directions addObject:direction];
}

- (void)addIngredientObject:(RecipeIngredient *)ingredient
{
    if (!self.ingredients) self.ingredients = [[NSMutableArray alloc] init];
    [(NSMutableArray *)self.ingredients addObject:ingredient];
}

@end
