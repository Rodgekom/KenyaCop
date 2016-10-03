//
//  CheckViewController.m
//  KenyaCop
//
//  Created by Johnstone Ananda on 29/09/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "CheckViewController.h"
#import <CoreData/CoreData.h>


@interface CheckViewController ()

@end

@implementation CheckViewController

@synthesize emergencyNewsLabel;
@synthesize emergencyName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    emergencyNewsLabel.text = emergencyName;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
