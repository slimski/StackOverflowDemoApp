//
//  AnswersViewController.h
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 26.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StackOverflowSDK/StackoverflowSDK.h>

@interface AnswersViewController : UITableViewController<AnswersDelegate>

@property (strong, nonatomic) Question *sourceQuestion;
@property (strong, nonatomic) NSArray *answers;
@property (strong, nonatomic) StackOverflowManager *manager;

@end
