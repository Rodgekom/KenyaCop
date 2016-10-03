//
//  ReportViewController.h
//  KenyaCop
//
//  Created by Timothy Reteti on 01/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ReportViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UITextField *reportType;
@property (weak, nonatomic) IBOutlet UITextField *reportDescription;
@property (weak, nonatomic) IBOutlet UIDatePicker *reportDate;

- (IBAction)submit:(id)sender;



@end
