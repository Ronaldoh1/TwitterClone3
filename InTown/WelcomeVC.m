//
//  WelcomeVC.m
//  InTown
//
//  Created by Ronald Hernandez on 9/4/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

#import "WelcomeVC.h"

@interface WelcomeVC ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;

@end

@implementation WelcomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.loginButton.layer.borderWidth = 2.0;
    self.signupButton.layer.borderWidth = 2.0;
    self.loginButton.layer.borderColor  = [UIColor whiteColor].CGColor;
    self.signupButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (IBAction)onSignInButtonTapped:(UIButton *)sender {

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"SignIn" bundle:nil];
    UIViewController *signInVC = [storyBoard instantiateViewControllerWithIdentifier:@"SignInVC"];
    [self presentViewController:signInVC animated:YES completion:nil];

}


- (IBAction)onSignUpButtonTapped:(UIButton *)sender {

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"SignUp" bundle:nil];
    UIViewController *signInVC = [storyBoard instantiateViewControllerWithIdentifier:@"SignUpVC"];
    [self presentViewController:signInVC animated:YES completion:nil];


    
}

- (IBAction)onSignInWithFacebookButtonTapped:(UIButton *)sender {


}
- (IBAction)onSignInWithTwitterButtonTapped:(UIButton *)sender {


}

@end
