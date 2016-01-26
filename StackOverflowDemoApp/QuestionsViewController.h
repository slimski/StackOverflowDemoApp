//
//  QuestionsViewController.h
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 24.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StackOverflowSDK/StackOverflowSDK.h>

@interface QuestionsViewController : UITableViewController <QuestionsDelegate>

@property (strong, nonatomic) NSArray *tableSource;
@property (strong, nonatomic) QuestionsViewController *quickAccessViewController;
@property (strong, nonatomic) StackOverflowManager *manager;

@end
