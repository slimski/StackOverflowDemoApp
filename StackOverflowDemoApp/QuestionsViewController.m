//
//  QuestionsViewController.m
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 24.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import "QuestionsViewController.h"
#import "QuestionViewCell.h"
#import <StackOverflowSDK/Question.h>
#import <StackOverflowSDK/User.h>
#import "AnswersViewController.h"

@interface QuestionsViewController ()

@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.estimatedRowHeight = 120;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.tableSource)
    {
        return self.tableSource.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    Question *question = [self.tableSource objectAtIndex:indexPath.row];

    [cell.authorButton setTitle:question.owner.display_name forState:UIControlStateNormal];
    [cell.authorButton sizeToFit];
    cell.authorId = question.owner.user_id;
    
    cell.questionLabel.text = question.title;
    [cell.questionLabel sizeToFit];
    cell.answersCountLabel.text = [NSString stringWithFormat:@"answers: %ld", (long)question.answer_count];
    

    for (int i=0; i<question.tags.count && i<5; i++) {
        NSString *tag = [question.tags objectAtIndex:i];
        UIButton *tagButton = [cell.tags objectAtIndex:i];
        [tagButton setTitle:tag forState:UIControlStateNormal];
    }
    
    for (NSUInteger i=question.tags.count; i<5; i++)
    {
        UIButton *tagButton = [cell.tags objectAtIndex:i];
        [tagButton setTitle:@"" forState:UIControlStateNormal];
    }
    cell.quickAccess = self.quickAccessViewController;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    dispatch_async(dispatch_get_main_queue(), ^{
        AnswersViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"answersView"];
        vc.sourceQuestion = [self.tableSource objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        
    });

}

- (void)questionsReceivedWithResult:(NSArray *)result
{
    self.quickAccessViewController.tableSource = result;
    self.quickAccessViewController.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:self.quickAccessViewController animated:YES completion:nil];
    
    // configure the Popover presentation controller
//    UIPopoverPresentationController *popController = [self.quickAccessViewController popoverPresentationController];
//    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
//    popController.sourceView = self.tableView; //The view containing the anchor rectangle for the popover.
//    popController.sourceRect = CGRectMake(384, 40, 0, 0); //The rectangle in the specified view in which to anchor the popover.
    
    //    popController.barButtonItem = self.leftButton;
    //    popController.delegate = self;

}

- (void)questionsFailedWithError:(NSError *)error
{
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
