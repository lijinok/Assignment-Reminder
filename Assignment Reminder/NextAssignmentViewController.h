//
//  NextAssignmentViewController.h
//  Assignment Reminder
//
//  Created by Jin Li on 10/6/13.
//  Copyright (c) 2013 Absolute JL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextAssignmentAppDelegate.h"
#import "Assignment.h"
#import "CustomNavigationViewController.h"

@interface NextAssignmentViewController : UIViewController <UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property (weak, nonatomic) IBOutlet UILabel *assignmentContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *nexAssignTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *submitInfoLabel;

@property (nonatomic, retain) NextAssignmentAppDelegate *appdelegate;

@property (nonatomic, retain) Assignment *assignment;

- (void)gotoAllAssignmentsView;
@end
