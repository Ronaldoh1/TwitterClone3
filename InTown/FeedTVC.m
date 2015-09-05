//
//  FeedTVC.m
//  InTown
//
//  Created by Ronald Hernandez on 9/4/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

#import "FeedTVC.h"
#import "User.h"

@interface FeedTVC ()
@property UIImage *tempImage;
@property User *currentUser;

@end

@implementation FeedTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpProfileImage];
}
//helper method to set up profile image button
-(void)setUpProfileImage{

    if (self.currentUser != nil){
        //create an image and assign it to defualt image

        [self getUsersProfileImage];


    }else if (self.currentUser == nil){


        self.tempImage = [UIImage imageNamed:@"defaultImage.png"];

    }


    UIImage *profileImage = self.tempImage;


    //create button frame
    CGRect buttonFrame = CGRectMake(0, 0, 40, 40);

    //Create left Button
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];

    //make the button rounded
    button.layer.cornerRadius = button.frame.size.height / 2;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 2.0;
    button.layer.borderColor = [UIColor colorWithRed:254.0/255.0 green:94/255.0 blue:1.0/255.0 alpha:1].CGColor;

    [button setImage:profileImage forState:UIControlStateNormal];
    [button reloadInputViews];

    //add at tap gesture recognizer to the left button
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(profileImageTapped:)];
    [button addGestureRecognizer:tapGesture];


    //create a custom view for the button
    UIView *profileButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    profileButtonView.bounds = CGRectOffset(profileButtonView.bounds, 10, 0);

    //add the button to the custom view
    [profileButtonView addSubview:button];

    UIBarButtonItem *profileButtonItem = [[UIBarButtonItem alloc]initWithCustomView:profileButtonView];
    
    self.navigationItem.leftBarButtonItem = profileButtonItem;
    
    
}

////Helper method to download user's profile image
-(void)getUsersProfileImage{

    [self.currentUser.profileImage getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:data];

            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

                dispatch_async(dispatch_get_main_queue(), ^(void) {

                    self.tempImage = image;

                });
            });
        }
        
    }];
}

/*helper method to show user's profile. present the account view controller to display menus for user
 if the current user does not exist, then make him/her sign up.*/

-(void)profileImageTapped:(UIBarButtonItem* )sender{


    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    UIViewController *NavVC = [storyBoard instantiateViewControllerWithIdentifier:@"ProfileNavVC"];
    [self presentViewController:NavVC animated:YES completion:nil];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
