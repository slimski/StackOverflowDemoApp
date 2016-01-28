//
//  SearchViewController.m
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 22.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import "SearchViewController.h"
#import "QuestionsViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.manager = [[StackOverflowManager alloc] init];
    self.manager.communicator = [[StackOverflowCommunicator alloc] init];
    self.manager.communicator.delegate = self.manager;
    self.manager.searchDelegate = self;
    NSLog(@"Search view controller did load");
}

- (IBAction)startSearch
{
    NSLog(@"start search");
    [self.manager searchQuestionsByText:self.searchQuery.text];
}

- (void)searchCompletedWithResult:(NSArray *)result
{
    dispatch_async(dispatch_get_main_queue(), ^{
        QuestionsViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"questionsView"];
        QuestionsViewController *quickAccessVC = [self.storyboard instantiateViewControllerWithIdentifier:@"questionsView"];
        quickAccessVC.manager = [[StackOverflowManager alloc] init];
        quickAccessVC.manager.questionsDelegate = mainVC;
        mainVC.quickAccessViewController = quickAccessVC;
        mainVC.tableSource = result;
        mainVC.title = self.searchQuery.text;
        [self.navigationController pushViewController:mainVC animated:YES];
    });
}

- (void)searchFailedWithError:(NSError *)error
{
    NSLog(@"search failed with error: %@", error);
}

@end
