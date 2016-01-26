//
//  QuestionAnswersDelegate.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 26.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuestionAnswersDelegate <NSObject>

- (void)questionAnswersCompletedWithResult:(NSData *)result;
- (void)questionAnswersFailedWithError:(NSError *)error;


@end
