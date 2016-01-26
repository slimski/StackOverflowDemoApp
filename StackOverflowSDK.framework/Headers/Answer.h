//
//  Answer.h
//  StackOverflowSDK
//
//  Created by Igor Nabokov on 26.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface Answer : NSObject

@property (nonatomic) int answer_id;
@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) User *owner;


@end
