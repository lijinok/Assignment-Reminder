//
//  NextAssignmentViewController.m
//  Assignment Reminder
//
//  Created by Jin Li on 10/6/13.
//  Copyright (c) 2013 Absolute JL. All rights reserved.
//

#import "NextAssignmentViewController.h"
#import "NextAssignmentAppDelegate.h"
#import "CustomNavigationViewController.h"
#import "AllAssignmentViewController.h"

@interface NextAssignmentViewController ()


@end

@implementation NextAssignmentViewController

@synthesize appdelegate;
@synthesize assignment;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Assignment Reminder";
    self.nexAssignTitleLabel.text = @"Your Next Assignment:";
    self.submitInfoLabel.text = @"If you have submitted this assignment, please click the button below.";
    //self.view.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    
    // Here self.navigationController is an instance of NavigationViewController (which is a root controller for the main window)
    //
    
    /*UIButton* fakeButton = (UIButton *) [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_launcher.png"]];
    UIBarButtonItem *fakeButtonItem = [[UIBarButtonItem alloc] initWithCustomView:fakeButton];
    self.navigationItem.leftBarButtonItem = fakeButtonItem;*/
   
    CustomNavigationViewController *navController = self.parentViewController;
    
 
    navController.delegate = self;
    
    UIBarButtonItem *_btn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_setting.png"]
                                                          style:UIBarButtonItemStylePlain
                                                         target:self.navigationController
                                                         action:@selector(toggleMenu)];
    
    self.navigationItem.rightBarButtonItem=_btn;
    
    UIBarButtonItem * tempButtonItem = [[UIBarButtonItem alloc] init];
    tempButtonItem .title = @"Back";
    
    self.navigationItem.backBarButtonItem = tempButtonItem ;
    
   // self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(toggleMenu)];
    
    

    [self updateAssignmentTitle];
    
    	// Do any additional setup after loading the view, typically from a nib.
}

- (void) updateAssignmentTitle{
    
    if(appdelegate.assignmentsDone == NO){
        [self hideAssignView:NO];
        
        //String info = assignments.get(currAssignIndex).getTitleDesp() + "\n\n"
        //+ "It is due on " + assignments.get(currAssignIndex).getDueDateInString() + ".";
        
        
        appdelegate = (NextAssignmentAppDelegate *)[[UIApplication sharedApplication] delegate];
        assignment = [appdelegate.assignments objectAtIndex:appdelegate.currAssignIndex];
        
        
        NSString *finalStr;
        
        NSDate *now = [NSDate date];
        NSDate *duedate = assignment.duedate;
        NSTimeInterval distanceBetweenDates = [duedate timeIntervalSinceDate:now];
        NSLog(@"internval-%f", distanceBetweenDates);
        
        if(distanceBetweenDates >= 0){
            NSInteger diffHours = fmod(distanceBetweenDates / (60 * 60 ), 24);
            NSInteger diffDays = distanceBetweenDates / (24 * 60 * 60);
            finalStr = [NSString stringWithFormat:@"You have %d days and %d hours to finish.", diffDays, diffHours];
            
        }else{
            finalStr = @"You have passed the deadline. Please submit soon.";

        }

        
        self.assignmentContentLabel.text = [NSString stringWithFormat:@"%@   %@\nIt is due on %@.\n\n%@", assignment.title,assignment.description, assignment.getDueDateStr, finalStr];
    }else{
        
        self.assignmentContentLabel.text = @"You have finished all assignments for this quarter. \n\n Congradtulations!\n";
        [self hideAssignView:YES];
    }

    
}

- (void) hideAssignView:(BOOL)hide{
    [self.nexAssignTitleLabel setHidden:hide];
    [self.submitInfoLabel setHidden:hide];
    [self.submitBtn setHidden:hide];
}

- (IBAction)confirmSubmit:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm you have submitted" message:[NSString stringWithFormat:@"%@   %@", assignment.title,assignment.description] delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
    
    [alert show];
}


-(void)clearSettings{
    
    appdelegate.assignmentsDone = NO;
    appdelegate.currAssignIndex = 0;
    
    [self saveSettings];

    [self updateAssignmentTitle];
    
   
}

- (void) saveSettings{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:appdelegate.currAssignIndex forKey:@"index"];
    [defaults setBool:appdelegate.assignmentsDone forKey:@"done"];
    [defaults synchronize];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) { // means share button pressed
        NSLog(@"not yet");
    }
    if(buttonIndex == 1) { // means apple button pressed
        NSLog(@"Yes");
        // current activity
        //NSString *temp = [NSString stringWithFormat:@"A string: %u",([appdelegate.assignments count]-1)];
        //NSLog(@"size: %u", ([appdelegate.assignments count]-1));
        
        //NSLog(@"before compare--index---%d  done--- %hhd", appdelegate.currAssignIndex, appdelegate.assignmentsDone);
        if(appdelegate.currAssignIndex != ([appdelegate.assignments count]-1)){
            appdelegate.currAssignIndex = appdelegate.currAssignIndex + 1;
            
        }else{
            appdelegate.currAssignIndex = 0;
            appdelegate.assignmentsDone = YES;
            
           
        }
        //NSLog(@"after compare--index---%d  done--- %hhd", appdelegate.currAssignIndex, appdelegate.assignmentsDone);

        
        [self saveSettings];
        [self updateAssignmentTitle];
        
    }
    // and so on for the last button
}

- (void)gotoAllAssignmentsView {
    
    //AllAssignmentViewController *allAssignmentsView = [[AllAssignmentViewController alloc] init];
    
    //[self.navigationController pushViewController:allAssignmentsView animated:YES];
    
    //[self dismissModalViewControllerAnimated:YES];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    CustomNavigationViewController *navigationController = (CustomNavigationViewController *)self.navigationController;
    [navigationController.menu setNeedsLayout];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
@end
