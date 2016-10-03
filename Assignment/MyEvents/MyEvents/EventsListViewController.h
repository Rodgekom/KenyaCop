//
//  EventsListViewController.h
//  MyEvents
//
//  Created by Rodgers Komen on 30/09/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsListViewController : UIViewController


@property (strong, nonatomic) IBOutlet UISearchBar *eventsSearch;


@property (strong, nonatomic) IBOutlet UITableView *eventsTable;

@property (assign, nonatomic) BOOL ascending;
@end


