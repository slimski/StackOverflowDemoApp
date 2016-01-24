//
//  SearchDelegate.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 22.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchDelegate <NSObject>

- (void)searchCompletedWithResult:(NSArray *)result;
- (void)searchFailedWithError:(NSError *)error;

@end
