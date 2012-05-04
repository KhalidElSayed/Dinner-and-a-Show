//
//  RestaurantSearchViewController.m
//  Dinner and a Movie
//
//  Created by Joe Blough on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RestaurantSearchViewController.h"

@interface RestaurantSearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchZipCode;
@property (weak, nonatomic) IBOutlet UITextField *searchTerm;
@property (weak, nonatomic) IBOutlet UISwitch *onlyIncludeDealsSwitch;

@end

@implementation RestaurantSearchViewController

@synthesize searchZipCode;
@synthesize searchTerm;
@synthesize onlyIncludeDealsSwitch;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setSearchZipCode:nil];
    [self setSearchTerm:nil];
    [self setOnlyIncludeDealsSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)backgroundTouched
{
    if ([self.searchZipCode isFirstResponder])
        [self.searchZipCode resignFirstResponder];
    
    if ([self.searchTerm isFirstResponder])
        [self.searchTerm resignFirstResponder];
}

- (IBAction)done:(id)sender
{
    RestaurantSearchCriteria *criteria = [[RestaurantSearchCriteria alloc] init];
    criteria.zipCode = self.searchZipCode.text;
    criteria.searchTerm = self.searchTerm.text;
    criteria.onlyIncludeDeals = self.onlyIncludeDealsSwitch.on;
    
    [self.delegate search:criteria sender:self];
}

@end
