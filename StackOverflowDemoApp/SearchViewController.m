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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.manager = [[StackOverflowManager alloc] init];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Prepare for segue: %@", segue.identifier);
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)startSearch
{
    NSLog(@"start search");
    [self.manager searchQuestionsByText:self.searchQuery.text];
    // OR MyViewController *vc = [[MyViewController alloc] init];
    
    // any setup code for *vc
    
    
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
