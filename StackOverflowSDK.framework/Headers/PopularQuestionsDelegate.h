//
//  PopularQuestionsDelegate.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 22.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PopularQuestionsDelegate <NSObject>

- (void)popularUserQuestionsCompletedWithResult:(NSData *)result;
- (void)popularUserQuestionsFailedWithError:(NSError *)error;

- (void)popularTagQuestionsCompletedWithResult:(NSData *)result;
- (void)popularTagQuestionsFailedWithError:(NSError *)error;

@end
