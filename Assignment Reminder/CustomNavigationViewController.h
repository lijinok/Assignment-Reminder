//
//  CustomNavigationViewController.h
//  Assignment Reminder
//
//  Created by Jin Li on 10/6/13.
//  Copyright (c) 2013 Absolute JL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMenu.h"
@protocol CustomNavigationViewControllerDelegate <NSObject>
- (void)clearSettings;
@end

@interface CustomNavigationViewController : UINavigationController
{
    __weak id<CustomNavigationViewControllerDelegate> delegate;

}
@property (strong, readonly, nonatomic) REMenu *menu;
@property(nonatomic, weak) id<CustomNavigationViewControllerDelegate> delegate;

//@property (nonatomic, retain) id <UINavigationControllerDelegate> delegate;
- (void)toggleMenu;
@end
