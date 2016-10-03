//
//  MoviesViewController.h
//  MovieApp
//
//  Created by Rodgers Komen on 21/07/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataService.h"

@interface MoviesViewController : UIViewController
{
    NSString *noResultText;
    
}

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) NSMutableArray  *masterFilmList;




@end
