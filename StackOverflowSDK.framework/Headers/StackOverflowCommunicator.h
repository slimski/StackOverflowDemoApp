//
//  StackOverflowCommunicator.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 20.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchQueryDelegate;
@protocol PopularQuestionsDelegate;

@interface StackOverflowCommunicator : NSObject

@property (weak, nonatomic) id<SearchQueryDelegate> delegate;
@property (weak, nonatomic) id<PopularQuestionsDelegate> questionsDelegate;
- (void)searchQuestionsByText:(NSString *)text;
- (void)getPopularQuestionsByOwnerId:(NSUInteger)ownerId;
- (void)getPopularQuestionsByTag:(NSString *)tag;

@end
