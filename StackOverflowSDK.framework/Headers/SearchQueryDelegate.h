//
//  StackOverflowCommunicator.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 20.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchQueryDelegate <NSObject>

- (void)searchCompletedWithResult:(NSData *)result;
- (void)searchFailedWithError:(NSError *)error;


@end
