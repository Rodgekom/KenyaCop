//
//  DirectoryViewController.h
//  KenyaCop
//
//  Created by Johnstone Ananda on 01/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DirectoryViewController : UIViewController

{
    
    
    IBOutlet UITableView *directoryTable;
  
    
    
}
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;



@property (assign, nonatomic) BOOL ascending;
@property (strong, nonatomic) IBOutlet UILabel *stationName;
@property (strong, nonatomic) IBOutlet UILabel *areaName;
@property (strong, nonatomic) IBOutlet UILabel *telNumber;

@end
