//
//  ReportViewController.m
//  KenyaCop
//
//  Created by Timothy Reteti on 01/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "ReportViewController.h"
#import "SWRevealViewController.h"
#import <CoreData/CoreData.h>


@interface ReportViewController ()

@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


    
    - (IBAction)submit:(id)sender {
        NSManagedObjectContext *context = [self managedObjectContext];
        
        // Create a new managed object
       NSManagedObject *newReport = [NSEntityDescription insertNewObjectForEntityForName:@"Report" inManagedObjectContext:context];
//        
//        NSDateFormatter *userFormatter = [[NSDateFormatter alloc] init];
//        [userFormatter setTimeZone:[NSTimeZone localTimeZone]];
//        [userFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
//        NSString *dateConverted = [userFormatter stringFromDate:self.reportDate.date];
//        NSLog(@"%@",dateConverted);
//        
       
        
        [newReport setValue:self.reportType.text forKey:@"reportType"];
        [newReport setValue:self.reportDescription.text forKey:@"reportDescription"];
//        [newReport setValue:self.reportDate.textInputMode forKey:@"reportDate"];
       [newReport setValue:self.reportDate.date forKey:@"reportDate"];
        
        NSError *error = nil;
        if ([[self managedObjectContext] save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
        NSString *myRequestString = [[NSString alloc] initWithFormat:@"reportType=%@&reportDescription=%@&reportDate=%@", _reportType, _reportDescription, _reportDate];
        NSData *myRequestData = [ NSData dataWithBytes: [ myRequestString UTF8String ] length: [ myRequestString length ] ];
        NSMutableURLRequest *request = [ [ NSMutableURLRequest alloc ] initWithURL: [ NSURL URLWithString:@"http://url.com/iphone/iphone.php/?"]];
        
        [request setHTTPMethod: @"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
        [request setHTTPBody: myRequestData];
        NSURLResponse *response;
        NSError *err;
        NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&err];
        NSString *content = [NSString stringWithUTF8String:[returnData bytes]];
        NSLog(@"responseData: %@", content);
        
        NSString* responseString = [[NSString alloc] initWithData:returnData encoding:NSNonLossyASCIIStringEncoding];
        if ([content isEqualToString:responseString])
        {
            
        }
        
    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
