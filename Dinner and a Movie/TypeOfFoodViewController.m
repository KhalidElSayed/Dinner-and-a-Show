//
//  TypeOfFoodViewController.m
//  Dinner and a Movie
//
//  Created by Joe Blough on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TypeOfFoodViewController.h"
#import "PearsonFetcher.h"

#define kFoodTypeRecipes 0
#define kFoodTypeRestaurants 1

@interface TypeOfFoodViewController ()

@property (nonatomic, strong) NSArray *cuisines;
@property (nonatomic, strong) NSArray *restaurants;
@property (weak, nonatomic) IBOutlet UISegmentedControl *foodTypeSegmentControl;
@property (weak, nonatomic) IBOutlet UITableView *foodTypesTableView;

@end

@implementation TypeOfFoodViewController

@synthesize cuisines = _cuisines;
@synthesize restaurants = _restaurants;
@synthesize foodTypeSegmentControl = _foodTypeSegmentControl;
@synthesize foodTypesTableView = _foodTypesTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setFoodTypeSegmentControl:nil];
    [self setFoodTypesTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)loadRecipeTypes
{
    if (![self.cuisines count]) self.cuisines = [PearsonFetcher cuisines];
    NSLog(@"%d cuisines:", [self.cuisines count]);
    for (Cuisine *cuisine in self.cuisines) {
        NSLog(@"Cuisine: %@, %d recipes", cuisine.name, cuisine.recipeCount);
    }
    [self.foodTypesTableView reloadData];
}

- (void)loadRestaurantTypes
{
    
}

- (IBAction)changedFoodTypeSource:(UISegmentedControl *)sender
{
    switch ([sender selectedSegmentIndex]) {
        case kFoodTypeRecipes:
            [self loadRecipeTypes];
            break;
        case kFoodTypeRestaurants:
            [self loadRestaurantTypes];
            break;
        default:
            break;
    } 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (self.foodTypeSegmentControl.selectedSegmentIndex == kFoodTypeRecipes) ? 
        [self.cuisines count] : [self.restaurants count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Type of Food Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (self.foodTypeSegmentControl.selectedSegmentIndex == kFoodTypeRecipes) {
        Cuisine *cuisine = [self.cuisines objectAtIndex:indexPath.row];
        cell.textLabel.text = cuisine.name;
        cell.detailTextLabel.text = (cuisine.recipeCount == 1) ? @"1 recipe" : [NSString stringWithFormat:@"%d recipes", cuisine.recipeCount];
    }
    else {
        
    }
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@", segue.identifier);
}

@end
