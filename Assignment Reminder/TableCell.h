//
//  TableCell.h
//  Assignment Reminder
//
//  Created by Jin Li on 10/7/13.
//  Copyright (c) 2013 Absolute JL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *submitStatusLabel;
@property (nonatomic, weak) IBOutlet UILabel *duedateLabel;
@end
