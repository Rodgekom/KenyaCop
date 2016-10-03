//
//  NewsViewController.h
//  KenyaCop
//
//  Created by Timothy Reteti on 01/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    
    
    
    IBOutlet UITableView *newsTable;
}


//@property (weak, nonatomic) IBOutlet UITableView *newsTable;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (assign, nonatomic) BOOL ascending;

@end
