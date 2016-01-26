//
//  QuestionsDelegate.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 26.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuestionsDelegate <NSObject>

- (void)questionsReceivedWithResult:(NSArray *)result;
- (void)questionsFailedWithError:(NSError *)error;

@end
