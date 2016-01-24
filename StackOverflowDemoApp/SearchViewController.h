//
//  SearchViewController.h
//  StackOverflowDemoApp
//
//  Created by Igor Nabokov on 22.01.16.
//  Copyright © 2016 Igor Nabokov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StackOverflowSDK/StackoverflowSDK.h>

@interface SearchViewController : UIViewController<SearchDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchQuery;
@property (strong, nonatomic) StackOverflowManager *manager;
- (IBAction)startSearch;

@end
