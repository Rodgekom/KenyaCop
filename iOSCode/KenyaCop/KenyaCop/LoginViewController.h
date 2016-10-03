//
//  LoginViewController.h
//  KenyaCop
//
//  Created by Johnstone Ananda on 22/09/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface LoginViewController : UIViewController <FBSDKLoginButtonDelegate>


    @property (weak, nonatomic) IBOutlet UILabel *lblLoginStatus;
    @property (weak, nonatomic) IBOutlet FBSDKProfilePictureView *profilePicture;
    @property (weak, nonatomic) IBOutlet UILabel *lblUsername;
    @property (weak, nonatomic) IBOutlet UILabel *lblEmail;

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
   
-(IBAction)saveButtonTouched:(id)sender;
@end
