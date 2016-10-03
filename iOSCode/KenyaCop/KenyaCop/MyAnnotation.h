//
//  MyAnnotation.h
//  KenyaCop
//
//  Created by Timothy Reteti on 16/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <CoreLocation/CoreLocation.h>

@interface MyAnnotation : NSObject  <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@end
