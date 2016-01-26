//
//  QuestionViewCell.h
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 24.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuestionsViewController;

@interface QuestionViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *authorButton;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answersCountLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tags;

@property (weak, nonatomic) QuestionsViewController *quickAccess;

- (IBAction)showAuthorQuestions:(UIButton *)sender;
- (IBAction)showTagQuestions:(UIButton *)sender;


@end
