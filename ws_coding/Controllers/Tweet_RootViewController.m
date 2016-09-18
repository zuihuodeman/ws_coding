//
//  Tweet_RootViewController.m
//  ws_coding
//
//  Created by ws on 16/9/3.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "Tweet_RootViewController.h"

@interface Tweet_RootViewController ()

@end

@implementation Tweet_RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hot_topic_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(hotTopicBtnClicked:)];
    
    [self.parentViewController.navigationItem setLeftBarButtonItem:leftBarItem animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark button action
- (void)hotTopicBtnClicked:(id)sender{
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
