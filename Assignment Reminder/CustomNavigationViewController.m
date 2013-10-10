//
//  CustomNavigationViewController.m
//  Assignment Reminder
//
//  Created by Jin Li on 10/6/13.
//  Copyright (c) 2013 Absolute JL. All rights reserved.
//

#import "CustomNavigationViewController.h"
#import "AllAssignmentViewController.h"
#import "REMenu.h"
@interface CustomNavigationViewController ()
@property (strong, readwrite, nonatomic) REMenu *menu;

@end

@implementation CustomNavigationViewController

//@synthesize delegate;

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
    //self.navigationBar.barTintColor = [UIColor blackColor];
    /*if (REUIKitIsFlatMode()) {
        [self.navigationBar performSelector:@selector(setBarTintColor:) withObject:[UIColor colorWithRed:0/255.0 green:213/255.0 blue:161/255.0 alpha:1]];
        self.navigationBar.tintColor = [UIColor whiteColor];
    } else {
        self.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
    }*/
    
    REMenuItem *viewAllItem = [[REMenuItem alloc] initWithTitle:@"View All Assignments"
                                                       image:nil
                                                        highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            AllAssignmentViewController *allAssignmentsView = [[AllAssignmentViewController alloc] init];
                                                            
                                                            [self pushViewController:allAssignmentsView animated:YES];
                                                        
                                                      }];
    REMenuItem *clearSubmitItem = [[REMenuItem alloc] initWithTitle:@"Clear All Submit Status"
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             [self.delegate clearSettings]; 
                                                             
                                                         }];
    
    self.menu = [[REMenu alloc] initWithItems:@[viewAllItem, clearSubmitItem]];
    //[self.menu showFromNavigationController:self.navigationController];
    
    // Background view
    //
    //self.menu.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    //self.menu.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //self.menu.backgroundView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.600];
    
    //self.menu.imageAlignment = REMenuImageAlignmentRight;
    //self.menu.closeOnSelection = NO;
    //self.menu.appearsBehindNavigationBar = NO; // Affects only iOS 7
    /*if (!REUIKitIsFlatMode()) {
        self.menu.cornerRadius = 4;
        self.menu.shadowRadius = 4;
        self.menu.shadowColor = [UIColor blackColor];
        self.menu.shadowOffset = CGSizeMake(0, 1);
        self.menu.shadowOpacity = 1;
    }
    self.menu.imageOffset = CGSizeMake(5, -1);
    self.menu.waitUntilAnimationIsComplete = NO;
    self.menu.badgeLabelConfigurationBlock = ^(UILabel *badgeLabel, REMenuItem *item) {
        badgeLabel.backgroundColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
        badgeLabel.layer.borderColor = [UIColor colorWithRed:0.000 green:0.648 blue:0.507 alpha:1.000].CGColor;
    };*/
	// Do any additional setup after loading the view.
}

- (void)toggleMenu
{
    if (self.menu.isOpen)
        return [self.menu close];
    
    [self.menu showFromNavigationController:self];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
