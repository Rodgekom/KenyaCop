//
//  MapViewController.m
//  KenyaCop
//
//  Created by Johnstone Ananda on 01/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "MapViewController.h"
#import "SWRevealViewController.h"
#import "MyAnnotation.h"
//#import "JSONKit.h"

@interface MapViewController ()

{
    NSMutableArray *array;
    
    // A dictionary object
    NSDictionary *dict;
    

}


@end

@implementation MapViewController
@synthesize mapView;

@synthesize dispensaries;
@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
        // Create array to hold dictionaries
    
    array = [[NSMutableArray alloc] init];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString:@"http://www.wrostdevelopers.com/KenyaInfoCop/mobileAPI/?action=getAllEvents"]];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    printf("%s",jsonObjects);
    // values in foreach loop
    
    for (NSDictionary *dictionary in array) {
        assert([dictionary respondsToSelector:@selector(objectForKey:)]);
        
        CLLocationCoordinate2D coord = {[[dictionary objectForKey:@"lat"] doubleValue], [[dictionary objectForKey:@"lng"] doubleValue]};
        
        MyAnnotation *ann = [[MyAnnotation alloc] init];
        ann.title = [dictionary objectForKey:@"Name"];
        ann.coordinate = coord;
        [mapView addAnnotation:ann];
    }
    
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    
    self.mapView.delegate = self;
}
//
//    
//    for (NSDictionary *dataDict in jsonObjects) {
//        
//        NSString *strEventName = [dataDict objectForKey:@"event_name"];
//        NSString *strEventDescription = [dataDict objectForKey:@"event_description"];
//        NSString *strEventDate = [dataDict objectForKey:@"date_posted"];
//        
//        dict = [NSDictionary dictionaryWithObjectsAndKeys:
//                strEventName, eventname,
//                strEventDescription, eventdescription,
//                strEventDate, dateposted,
//                nil];
//        [myObject addObject:dict];
//    }

    
 //   self.mapView.delegate = self;
//    
//    CLLocationCoordinate2D rodgersCordinates = CLLocationCoordinate2DMake(36.095972, -0.2970685);
//    MyAnnotation *rodgersAnnotation = [[MyAnnotation alloc]initWithTitle:@"Rodgers Komen" Location:rodgersCordinates];
//    [self.mapView addAnnotation:rodgersAnnotation];
    
//    NSLog(@"Getting Device Locations");
//    NSString *hostStr = @"http://stylerepublicmagazine.com/dispensaries.php";
//    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:hostStr]];
//    NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
//    NSLog(@"server output: %@", serverOutput);
//    NSMutableArray *array = [[[serverOutput objectFromJSONString] mutableCopy] autorelease];
//    dispensaries = [serverOutput objectFromJSONString];
//    NSLog(@"%@", [serverOutput objectFromJSONString]);
//    
//    for (NSDictionary *dictionary in array) {
//        assert([dictionary respondsToSelector:@selector(objectForKey:)]);
//        
//        CLLocationCoordinate2D coord = {[[dictionary objectForKey:@"lat"] doubleValue], [[dictionary objectForKey:@"lng"] doubleValue]};
//        
//        MyAnnotation *ann = [[MyAnnotation alloc] init];
//        ann.title = [dictionary objectForKey:@"Name"];
//        ann.coordinate = coord;
//        [mapView addAnnotation:ann];
//    }
//    
//    [mapView setMapType:MKMapTypeStandard];
//    [mapView setZoomEnabled:YES];
//    [mapView setScrollEnabled:YES];
//    
//    self.mapView.delegate = self;
//}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation     {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"You Are Here";
    point.subtitle = @"Your current location";
    
    [self.mapView addAnnotation:point];
}

//    
//}
//
//- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
//{
//    CLLocationCoordinate2D coord = self.mapView.userLocation.location.coordinate;
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 1000.0, 1000.0);
//    [self.mapView setRegion:region animated:YES];
//}
//
//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
//{
//    if([annotation isKindOfClass:[MyAnnotation class]])
//    {
//    MyAnnotation *myLocation = (MyAnnotation *)annotation;
//        
//        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"MyAnnotation"];
//        
//        if(annotationView = nil){
//            annotationView = myLocation.annotationView;
//        }
//        else {
//            annotationView.annotation = annotation;
//        }
//        return annotationView;
//    }
//    else
//        return nil;
//    
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
