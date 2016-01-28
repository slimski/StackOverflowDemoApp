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


- (IBAction)showAuthorQuestions:(UIButton *)sender
{
    if (!self.quickAccess)
        return;
    
    
    [self.quickAccess.manager getQuestionsByAuthor:self.authorId];
}

- (IBAction)showTagQuestions:(UIButton *)sender
{
    if (!self.quickAccess)
        return;
    
    [self.quickAccess.manager getQuestionsByTag:sender.titleLabel.text];
}
@end
