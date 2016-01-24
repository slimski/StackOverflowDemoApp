//
//  StackOverflowManager.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 22.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchDelegate.h"
#import "SearchQueryDelegate.h"

@class StackOverflowCommunicator;

@interface StackOverflowManager : NSObject<SearchQueryDelegate>

@property (strong, nonatomic) StackOverflowCommunicator *communicator;
@property (weak, nonatomic) id<SearchDelegate> searchDelegate;

- (void)searchQuestionsByText:(NSString *)text;

@end
