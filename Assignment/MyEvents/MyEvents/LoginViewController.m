//
//  LoginViewController.m
//  MyEvents
//
//  Created by Rodgers Komen on 29/09/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface LoginViewController ()
-(void)toggleHiddenState:(BOOL)shouldHide;
    
    @end


@implementation LoginViewController
    @synthesize facebookLogin=_facebookLogin;
    @synthesize proceedButton= _proceedButton;
    @synthesize profilePicture=_profilePicture;
    
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    // Handle clicks on the button
    [_facebookLogin
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the view
    [self.view addSubview:_facebookLogin];
    //code to hide the subviews that should only be displayed after the user has logged in
    [ self toggleHiddenState:YES];
    self.lblLoginStatus.text= @"";
    // Contains an arrray pof the permissions that we would like to read from our application.
    self:_facebookLogin.readPermissions= @[@"public_profile", @"email"];
    self.facebookLogin.delegate= self;
    
}
-(void)loginButtonClicked
    {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login
         logInWithReadPermissions: @[@"public_profile"]
         fromViewController:self
         handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
             if (error) {
                 NSLog(@"Process error");
             } else if (result.isCancelled) {
                 NSLog(@"Cancelled");
             } else {
                 NSLog(@"Logged in");
             }
         }];
    }
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
-(void)toggleHiddenState:(BOOL)shouldHide{
    self.lblUsername.hidden= shouldHide;
    self.profilePicture.hidden =shouldHide;
    self.lblEmail.hidden=shouldHide;
    self.proceedButton.hidden= shouldHide;
}
-(void)loginViewShowingLoggedInUser:(FBSDKLoginButton *) loginView{
    self.lblLoginStatus.text =@ "You are logged in";
    [self toggleHiddenState:NO];
}
-(void)loginViewShowingLoggedOutUser:(FBSDKLoginButton *)loginView{
    self.lblLoginStatus.text = @"You are logged out";
    [self toggleHiddenState:NO];
}
    
    /*
     #pragma mark - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
- (IBAction)saveButtonTouched:(id)sender{
    
}
    @end
