//
//  AllAssignmentViewController.m
//  Assignment Reminder
//
//  Created by Jin Li on 10/7/13.
//  Copyright (c) 2013 Absolute JL. All rights reserved.
//

#import "AllAssignmentViewController.h"
#import "Assignment.h"
#import "NextAssignmentAppDelegate.h"
#import "TableCell.h"
@interface AllAssignmentViewController ()
@property (nonatomic, retain)NSMutableArray *assignments;
@property (nonatomic, retain) NextAssignmentAppDelegate *appdelegate;
@end

@implementation AllAssignmentViewController

@synthesize appdelegate;
@synthesize assignments;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"All Assignments";
    
    appdelegate = (NextAssignmentAppDelegate *)[[UIApplication sharedApplication] delegate];
    assignments = appdelegate.assignments;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [assignments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TableCell";
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    // Configure the cell...
    
    
    if (appdelegate.assignmentsDone == YES || [indexPath row] < appdelegate.currAssignIndex) {
        cell.submitStatusLabel.textColor = [UIColor colorWithRed:0 green:0.522 blue:0 alpha:1] /*#008500*/;
        cell.submitStatusLabel.text = @"Submitted";
    }else{
        cell.submitStatusLabel.textColor = [UIColor colorWithRed:0.651 green:0 blue:0 alpha:1] /*#a60000*/;
        cell.submitStatusLabel.text = @"Not Submitted";
    }
    Assignment *assignment = [assignments objectAtIndex: [indexPath row]];
    cell.titleLabel.text = [[NSString alloc] initWithFormat:@"%@   %@", assignment.title, assignment.description];
    
    cell.duedateLabel.text = [NSString stringWithFormat:@"Due on %@", assignment.getSimpleDuedateStr];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
