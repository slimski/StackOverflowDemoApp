//
//  QuestionViewCell.m
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 24.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import "QuestionViewCell.h"
#import <StackOverflowSDK/StackOverflowSDK.h>
#import "QuestionsViewController.h"

@implementation QuestionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showAuthorQuestions:(UIButton *)sender
{
    if (!self.quickAccess)
        return;
    
    
    [self.quickAccess.manager getQuestionsByAuthor:self.authorId];
}

- (IBAction)showTagQuestions:(UIButton *)sender {
}
@end
