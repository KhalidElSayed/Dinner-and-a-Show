//
//  RestaurantDetailsViewController.m
//  Dinner and a Movie
//
//  Created by Joe Blough on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RestaurantDetailsViewController.h"
#import "SVProgressHUD.h"

@interface RestaurantDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation RestaurantDetailsViewController
@synthesize webView = _webView;
@synthesize restaurant = _restaurant;

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
    
    self.title = self.restaurant.name;
    self.webView.delegate = self;
    [SVProgressHUD showWithStatus:@"Loading web page"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:
                               [NSURL URLWithString:self.restaurant.mobileUrl]]];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [SVProgressHUD dismissWithError:error.localizedDescription];
}

@end
