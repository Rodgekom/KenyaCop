//
//  CrimeViewController.h
//  KenyaCop
//
//  Created by Johnstone Ananda on 02/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrimeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    
    

    IBOutlet UITableView *crimeTable;
       
}


//@property (weak, nonatomic) IBOutlet UITableView *crimeTable;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;


@property (assign, nonatomic) BOOL ascending;

@end
