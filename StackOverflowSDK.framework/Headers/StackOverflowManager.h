//
//  StackOverflowManager.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 22.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchQueryDelegate.h"
#import "PopularQuestionsDelegate.h"
#import "QuestionAnswersDelegate.h"

@protocol SearchDelegate;
@protocol QuestionsDelegate;
@protocol AnswersDelegate;

@class StackOverflowCommunicator;

@interface StackOverflowManager : NSObject<SearchQueryDelegate, PopularQuestionsDelegate, QuestionAnswersDelegate>

@property (strong, nonatomic) StackOverflowCommunicator *communicator;
@property (weak, nonatomic) id<SearchDelegate> searchDelegate;
@property (weak, nonatomic) id<QuestionsDelegate> questionsDelegate;
@property (weak, nonatomic) id<AnswersDelegate> answersDelegate;


- (void)searchQuestionsByText:(NSString *)text;
- (void)getQuestionsByAuthor:(int)authorId;
- (void)getQuestionsByTag:(NSString *)tag;
- (void)getAnswersByQuestion:(int)questionId;

@end
