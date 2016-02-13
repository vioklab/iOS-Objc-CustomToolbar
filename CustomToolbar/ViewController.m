//
//  ViewController.m
//  Sizes
//
//  Created by bbluue IMac on 2/13/16.
//  Copyright © 2016 bbluue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIToolbar *toolbar;
    UIImage* toolbarImage;
    
    UIImage* barInfoButtonImage;
    UIBarButtonItem *barInfoButton;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // TOOLBAR
    toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 57.5, self.view.frame.size.width, 57.5)];
    toolbarImage = [UIImage imageNamed: @"barra"];
    [toolbar setBackgroundImage:toolbarImage forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    toolbar.opaque = YES;
    toolbar.translucent = YES;
    toolbar.clipsToBounds = YES;
    
    // Toolbar Buttons with images
    barInfoButtonImage = [UIImage imageNamed: @"icons_takephoto-toolbar-info"];
    barInfoButton = [[UIBarButtonItem alloc] initWithImage:barInfoButtonImage style:UIBarButtonItemStyleDone target:nil action:@selector(infoButtonPressed:)];
    barInfoButton.tintColor = [UIColor whiteColor];
    
    
    UIImage* barAudioButtonImage = [UIImage imageNamed: @"icons_takephoto-toolbar-audio"];
    UIBarButtonItem *barAudioButton = [[UIBarButtonItem alloc] initWithImage:barAudioButtonImage style:UIBarButtonItemStyleDone target:nil action:nil];
    barAudioButton.tintColor = [UIColor whiteColor];
    
    UIImage* barShareButtonImage = [UIImage imageNamed: @"icons_takephoto-toolbar-share"];
    UIBarButtonItem *barShareButton = [[UIBarButtonItem alloc] initWithImage:barShareButtonImage style:UIBarButtonItemStyleDone target:nil action:nil];
    barShareButton.tintColor = [UIColor whiteColor];
    
    UIImage* barDeleteButtonImage = [UIImage imageNamed: @"icons_takephoto-toolbar-delete"];
    UIBarButtonItem *barDeleteButton = [[UIBarButtonItem alloc] initWithImage:barDeleteButtonImage style:UIBarButtonItemStyleDone target:nil action:nil];
    barDeleteButton.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    // Toolbars Buttons to Array
    NSArray *toolbarButtons = [[NSArray alloc] initWithObjects:barInfoButton, barAudioButton, barShareButton, barDeleteButton, flexSpace, nil];
    // Set buttons as items
    toolbar.items = toolbarButtons;
    // Set Toolbar Subview
    [self.view addSubview:toolbar];
    // -????
    [toolbar release];
    
}

-(void)infoButtonPressed:(UIBarButtonItem *)sender
{
    //NSLog(@"%@",sender);
    UIImage* backgroundImage = [UIImage imageNamed: @"icons_takephoto-toolbar-info-highlighted"];
    [barInfoButton setImage:backgroundImage];
}

// Changing color Status bar to white
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

// Hidding Status bar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
