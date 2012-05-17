//
//  Recipes.h
//  Dinner and a Movie
//
//  Created by Joe Blough on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RecipeDirection, RecipeIngredient, RecipeNutritionalInformation, ScheduledRecipeEvent;

@interface Recipes : NSManagedObject

@property (nonatomic, retain) NSString * kind;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * imageUrl;
@property (nonatomic, retain) NSString * thumbnailUrl;
@property (nonatomic, retain) NSString * cuisine;
@property (nonatomic, retain) NSString * cookingMethod;
@property (nonatomic, retain) NSNumber * serves;
@property (nonatomic, retain) NSString * yields;
@property (nonatomic, retain) NSNumber * cost;
@property (nonatomic, retain) RecipeIngredient *ingredients;
@property (nonatomic, retain) NSSet *directions;
@property (nonatomic, retain) NSSet *recipeAppts;
@property (nonatomic, retain) RecipeNutritionalInformation *nutritionalInfo;
@end

@interface Recipes (CoreDataGeneratedAccessors)

- (void)addDirectionsObject:(RecipeDirection *)value;
- (void)removeDirectionsObject:(RecipeDirection *)value;
- (void)addDirections:(NSSet *)values;
- (void)removeDirections:(NSSet *)values;

- (void)addRecipeApptsObject:(ScheduledRecipeEvent *)value;
- (void)removeRecipeApptsObject:(ScheduledRecipeEvent *)value;
- (void)addRecipeAppts:(NSSet *)values;
- (void)removeRecipeAppts:(NSSet *)values;

@end
