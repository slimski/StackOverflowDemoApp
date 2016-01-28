//
//  AnswersViewController.m
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 26.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import "AnswersViewController.h"

@interface AnswersViewController ()

@end

@implementation AnswersViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.manager = [[StackOverflowManager alloc] init];
    self.manager.answersDelegate = self;
    [self.manager getAnswersByQuestion:self.sourceQuestion.question_id];
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)answersReceivedWithResult:(NSArray *)result
{
    self.answers = result;
    [self.tableView reloadData];
}

- (void)answersFailedWithError:(NSError *)error
{
    NSLog(@"Querying failed with error: %@", error);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.answers)
        return self.answers.count;

    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"answerCell" forIndexPath:indexPath];
    Answer *answer = [self.answers objectAtIndex:indexPath.row];
    NSString *html = answer.body;
    
    NSAttributedString *htmlSource = [[NSAttributedString alloc]initWithData:[html dataUsingEncoding:NSUTF8StringEncoding]
                                                                     options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                          documentAttributes:NULL
                                                                       error:NULL];

    UILabel *answerLabel = [[cell.contentView subviews] objectAtIndex:0];
    answerLabel.attributedText = htmlSource;
    
    return cell;
}

@end
