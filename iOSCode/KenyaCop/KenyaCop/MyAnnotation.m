//
//  MyAnnotation.m
//  KenyaCop
//
//  Created by Timothy Reteti on 16/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize title, coordinate, subtitle;

-(void)dealloc{
    [title release];
    [super dealloc];
}

@end
