//
//  AnswersDelegate.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 26.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AnswersDelegate <NSObject>

- (void)answersReceivedWithResult:(NSArray *)result;
- (void)answersFailedWithError:(NSError *)error;


@end
