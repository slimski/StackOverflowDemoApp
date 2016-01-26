//
//  ModelsConverter.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 21.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelsConverter : NSObject

+ (NSArray *)questionsFromJsonData:(NSData *)json error:(NSError **)error;
+ (NSArray *)answersFromJsonData:(NSData *)json error:(NSError **)error;

@end
