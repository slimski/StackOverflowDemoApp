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
#import "QuickAccessPresentationController.h"

@interface QuestionsViewController ()

@end

@implementation QuestionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 120;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
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
    

    for (int i=0; i<question.tags.count && i<5; i++)
    {
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
    NSLog(@"questions received count:%lu", (unsigned long)result.count);
    self.quickAccessViewController.tableSource = result;
    [self.quickAccessViewController.tableView reloadData];
    UINavigationController *quickAccessNavigation = [[UINavigationController alloc]initWithRootViewController:self.quickAccessViewController];
    quickAccessNavigation.modalPresentationStyle = UIModalPresentationCustom;
    quickAccessNavigation.transitioningDelegate = self;
    self.quickAccessViewController.title = @"";
    self.quickAccessViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Close"
                                                                                                      style:UIBarButtonItemStyleDone
                                                                                                     target:self
                                                                                                     action:@selector(closeQuickAccess)];
    [self presentViewController:quickAccessNavigation animated:YES completion:nil];
}

- (void)questionsFailedWithError:(NSError *)error
{
    NSLog(@"Querying questions failed with error: %@", error);
}

- (void) closeQuickAccess
{
    [self.quickAccessViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[QuickAccessPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
