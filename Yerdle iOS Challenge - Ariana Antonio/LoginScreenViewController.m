//
//  LoginScreenViewController.m
//  Yerdle iOS Challenge - Ariana Antonio
//
//  Created by Ariana Antonio on 8/15/15.
//  Copyright (c) 2015 Ariana Antonio. All rights reserved.
//

#import "LoginScreenViewController.h"
#import "AuthorizationAPI.h"
#import "TokenStore.h"
#import "FirstViewController.h"

@interface LoginScreenViewController ()
@property (nonatomic, strong) TokenStore *tokenStore;
@property (nonatomic, strong) FirstViewController *firstViewController;
@end

@implementation LoginScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _firstViewController= [[FirstViewController alloc]init];
    _tokenStore = [[TokenStore alloc]init];
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = .5;
    border.borderColor = [UIColor lightGrayColor].CGColor;
    border.frame = CGRectMake(0, _emailField.frame.size.height - borderWidth, _emailField.frame.size.width, _emailField.frame.size.height);
    border.borderWidth = borderWidth;
    [_emailField.layer addSublayer:border];
    _emailField.layer.masksToBounds = YES;
    
    CALayer *borderPassword = [CALayer layer];
    CGFloat borderWidthPassword = .5;
    borderPassword.borderColor = [UIColor lightGrayColor].CGColor;
    borderPassword.frame = CGRectMake(0, _passwordField.frame.size.height - borderWidthPassword, _passwordField.frame.size.width, _passwordField.frame.size.height);
    borderPassword.borderWidth = borderWidthPassword;
    [_passwordField.layer addSublayer:borderPassword];
    _passwordField.layer.masksToBounds = YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_passwordField resignFirstResponder];
    
    //TO DO: Dismiss splash screen and transition to main screen, fix auto layout issues
    
    
    NSString *userEmail = _emailField.text;
    NSString *userPassword = _passwordField.text;
    
    if ([userEmail isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Please enter a valid email" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        
    } else if ([userPassword isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Please enter your password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    } else {

        [self emailLogin];
    }
    
    
    return NO;
}
-(void)emailLogin {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSDictionary *params = @{@"email": _emailField.text,
//                             @"password": _passwordField.text,
//                             @"provider": @"email"};
    
    NSDictionary *params = @{@"email": @"candidate@yerdl.es",
                             @"password": @"candidate",
                             @"provider": @"email"};
    
    [manager POST:@"https://api.yerdl.es/v2/sessions" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSLog(@"Login Successful");
        
        //store token
        NSString *authToken = [responseObject objectForKey:@"auth_token"];
        [self.tokenStore setAuthToken:authToken];
        
        //present tab bar controller
        UITabBarController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainView"];
        [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:vc animated:YES completion:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
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
