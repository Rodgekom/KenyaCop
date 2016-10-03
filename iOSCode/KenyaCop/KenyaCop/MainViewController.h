//
//  MainViewController.h
//  KenyaCop
//
//  Created by Rodgers Komen on 28/07/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


    
    
@property (strong, nonatomic) IBOutlet UITableView *emergencyTable;
  
  


@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (assign, nonatomic) BOOL ascending;


//@property (strong, nonatomic) IBOutlet UITableView *emergencyTable;


//@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;




//@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
