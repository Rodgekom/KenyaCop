//
//  MapViewController.h
//  KenyaCop
//
//  Created by Johnstone Ananda on 01/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
//    IBOutletCollection(MKMapView) NSArray *mapView;
   
    IBOutlet MKMapView *mapView;
   // UIToolbar *toolBar;
}

//@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
//@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;


@property (nonatomic, retain) NSMutableArray *dispensaries;
@property (nonatomic, retain) NSMutableData *data;

@end
