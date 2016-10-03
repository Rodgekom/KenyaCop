//
//  CrimeViewController.m
//  KenyaCop
//
//  Created by Johnstone Ananda on 02/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "CrimeViewController.h"
#import "SWRevealViewController.h"

@interface CrimeViewController ()

@end

@implementation CrimeViewController
{
    NSMutableArray *myObject;
    
    // A dictionary object
    NSDictionary *dict;
    
    // Define keys
    NSString *eventname;
    NSString *eventdescription;
    NSString *dateposted;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    // Define keys
    eventname = @"event_name";
    eventdescription = @"event_description";
    dateposted = @"date_posted";
    
    // Create array to hold dictionaries
    
    myObject = [[NSMutableArray alloc] init];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString:@"http://www.wrostdevelopers.com/KenyaInfoCop/mobileAPI/index.php?action=getCrimes"]];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    printf("%s",jsonObjects);
    // values in foreach loop
    for (NSDictionary *dataDict in jsonObjects) {
        
        NSString *strEventName = [dataDict objectForKey:@"event_name"];
        NSString *strEventDescription = [dataDict objectForKey:@"event_description"];
        NSString *strEventDate = [dataDict objectForKey:@"date_posted"];
        
        dict = [NSDictionary dictionaryWithObjectsAndKeys:
                strEventName, eventname,
                strEventDescription, eventdescription,
                strEventDate, dateposted,
                nil];
        [myObject addObject:dict];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return myObject.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        // Use the default cell style.
        cell = [[[UITableViewCell alloc] initWithStyle : UITableViewCellStyleSubtitle
                                       reuseIdentifier : CellIdentifier] autorelease];
    }
    
    
    NSDictionary *tmpDict = [myObject objectAtIndex:indexPath.row];
    
    // Event Name
    //    NSMutableString *text;
    //    text = [NSString stringWithFormat:@"Type : %@",[tmpDict objectForKey:eventname]];
    //
    // Name & Tel
    //    NSMutableString *detail;
    //    detail = [NSString stringWithFormat:@"Description : %@ , Date : %@"
    //              ,[tmpDict objectForKey:eventdescription]
    //              ,[tmpDict objectForKey:dateposted]];
    //
    NSMutableString *detail;
    detail = [NSString stringWithFormat:@"Date : %@",[tmpDict objectForKey:dateposted]];
    
    NSMutableString *text;
    text = [NSString stringWithFormat: [tmpDict objectForKey:eventdescription]];
    
    
    
    
    
    cell.textLabel.text = text;
    cell.detailTextLabel.text= detail;
    
    //[tmpDict objectForKey:memberid]
    
    //[tmpDict objectForKey:name]
    //[tmpDict objectForKey:tel]
    return cell;
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [crimeTable release];
    [super dealloc];
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
