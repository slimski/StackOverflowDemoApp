//
//  SearchViewController.m
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 22.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import "SearchViewController.h"


@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.manager = [[StackOverflowManager alloc] init];
//    self.manager.searchDelegate = self;
    NSLog(@"Search view controller did load");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.manager = [[StackOverflowManager alloc] init];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startSearch
{
    [self.manager searchQuestionsByText:self.searchQuery.text];
    UITableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"questionsView"];
    [self.navigationController pushViewController:vc animated:YES];
    // OR MyViewController *vc = [[MyViewController alloc] init];
    
    // any setup code for *vc
    
    
}

- (void)searchCompletedWithResult:(NSArray *)result
{

}

- (void)searchFailedWithError:(NSError *)error
{
    
}

@end
