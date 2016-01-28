//
//  QuickAccessPresentationController.m
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 28.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import "QuickAccessPresentationController.h"

@implementation QuickAccessPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
    return CGRectMake(0, self.containerView.bounds.size.height/2, self.containerView.bounds.size.width, self.containerView.bounds.size.height/2);
}

@end
