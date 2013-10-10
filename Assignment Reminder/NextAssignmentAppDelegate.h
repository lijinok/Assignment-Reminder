//
//  NextAssignmentAppDelegate.h
//  Assignment Reminder
//
//  Created by Jin Li on 10/6/13.
//  Copyright (c) 2013 Absolute JL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextAssignmentAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray *assignments;
    int currAssignIndex;
    BOOL assignmentsDone;
}

@property (nonatomic, retain)NSMutableArray *assignments;
@property (nonatomic,assign) int currAssignIndex;
@property (nonatomic,assign) BOOL assignmentsDone;
@property (strong, nonatomic) UIWindow *window;

@end
