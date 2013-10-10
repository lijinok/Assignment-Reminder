//
//  TableCell.m
//  Assignment Reminder
//
//  Created by Jin Li on 10/7/13.
//  Copyright (c) 2013 Absolute JL. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
@synthesize titleLabel, submitStatusLabel, duedateLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
