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
    UIButton *barInfoButton;
    UIBarButtonItem *barInfoButtonItem;
    
    UIImage* barAudioButtonImage;
    UIButton *barAudioButton;
    UIBarButtonItem *barAudioButtonItem;
    
    UIImage* barShareButtonImage;
    UIButton *barShareButton;
    UIBarButtonItem *barShareButtonItem;
    
    UIImage* barDeleteButtonImage;
    UIButton *barDeleteButton;
    UIBarButtonItem *barDeleteButtonItem;
    
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
    barInfoButtonImage = [UIImage imageNamed:@"icons_takephoto-toolbar-info"];
    CGRect frameimg = CGRectMake(0, 0, barInfoButtonImage.size.width, barInfoButtonImage.size.height);
    barInfoButton = [[UIButton alloc] initWithFrame:frameimg];
    [barInfoButton setBackgroundImage:barInfoButtonImage forState:UIControlStateNormal];
    [barInfoButton addTarget:self action:@selector(infoButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    [barInfoButton setShowsTouchWhenHighlighted:NO];
    barInfoButtonItem =[[UIBarButtonItem alloc] initWithCustomView:barInfoButton];
    self.navigationItem.rightBarButtonItem=barInfoButtonItem;
    
    
    barAudioButtonImage = [UIImage imageNamed: @"icons_takephoto-toolbar-audio"];
    frameimg = CGRectMake(0, 0, barAudioButtonImage.size.width, barAudioButtonImage.size.height);
    barAudioButton = [[UIButton alloc] initWithFrame:frameimg];
    [barAudioButton setBackgroundImage:barAudioButtonImage forState:UIControlStateNormal];
    [barAudioButton addTarget:self action:@selector(audioButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    [barAudioButton setShowsTouchWhenHighlighted:YES];
    
    barAudioButtonItem =[[UIBarButtonItem alloc] initWithCustomView:barAudioButton];
    self.navigationItem.rightBarButtonItem=barAudioButtonItem;
    

    barShareButtonImage = [UIImage imageNamed: @"icons_takephoto-toolbar-share"];
    frameimg = CGRectMake(0, 0, barShareButtonImage.size.width, barShareButtonImage.size.height);
    barShareButton = [[UIButton alloc] initWithFrame:frameimg];
    [barShareButton setBackgroundImage:barShareButtonImage forState:UIControlStateNormal];
    [barShareButton addTarget:self action:@selector(shareButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [barShareButton setShowsTouchWhenHighlighted:YES];
    
    barShareButtonItem =[[UIBarButtonItem alloc] initWithCustomView:barShareButton];
    self.navigationItem.rightBarButtonItem=barShareButtonItem;
    
    barDeleteButtonImage = [UIImage imageNamed: @"icons_takephoto-toolbar-delete"];
    frameimg = CGRectMake(0, 0, barDeleteButtonImage.size.width, barDeleteButtonImage.size.height);
    barDeleteButton = [[UIButton alloc] initWithFrame:frameimg];
    [barDeleteButton setBackgroundImage:barDeleteButtonImage forState:UIControlStateNormal];
    [barDeleteButton addTarget:self action:@selector(deleteButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [barDeleteButton setShowsTouchWhenHighlighted:YES];
    
    barDeleteButtonItem =[[UIBarButtonItem alloc] initWithCustomView:barDeleteButton];
    self.navigationItem.rightBarButtonItem=barDeleteButtonItem;
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    // Toolbars Buttons to Array
    NSArray *toolbarButtons = [[NSArray alloc] initWithObjects:barInfoButtonItem, barAudioButtonItem, barShareButtonItem, barDeleteButtonItem, flexSpace, nil];
    // Set buttons as items
    toolbar.items = toolbarButtons;
    // Set Toolbar Subview
    [self.view addSubview:toolbar];
    // -????
    [toolbar release];
    
}

- (void)infoButtonPressed:(id)sender{
    UIButton*btn = (UIButton*)sender;
    if (btn.isSelected)
    {
        [btn setSelected:NO];
        [btn setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-info"] forState:UIControlStateNormal];
    }
    else
    {
        [btn setSelected:YES];
        [btn setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-info-highlighted"] forState:UIControlStateNormal];
        [barAudioButton setSelected:NO];
        [barAudioButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-audio"] forState:UIControlStateNormal];
        [barShareButton setSelected:NO];
        [barShareButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-share"] forState:UIControlStateNormal];
        [barDeleteButton setSelected:NO];
        [barDeleteButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-delete"] forState:UIControlStateNormal];
    }
};

- (void)audioButtonPressed:(id)sender{
    UIButton*btn = (UIButton*)sender;
    if (btn.isSelected)
    {
        [btn setSelected:NO];
        [btn setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-audio"] forState:UIControlStateNormal];
        
    }
    else
    {
        [btn setSelected:YES];
        [btn setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-audio-highlighted"] forState:UIControlStateNormal];
        [barInfoButton setSelected:NO];
        [barInfoButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-info"] forState:UIControlStateNormal];
        [barShareButton setSelected:NO];
        [barShareButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-share"] forState:UIControlStateNormal];
        [barDeleteButton setSelected:NO];
        [barDeleteButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-delete"] forState:UIControlStateNormal];
    }
};

- (void)shareButtonPressed:(id)sender{
    UIButton*btn = (UIButton*)sender;
    if (btn.isSelected)
    {
        [btn setSelected:NO];
        [btn setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-share"] forState:UIControlStateNormal];
        
    }
    else
    {
        [btn setSelected:YES];
        [btn setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-share-highlighted"] forState:UIControlStateNormal];
        [barInfoButton setSelected:NO];
        [barInfoButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-info"] forState:UIControlStateNormal];
        [barAudioButton setSelected:NO];
        [barAudioButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-audio"] forState:UIControlStateNormal];
        [barDeleteButton setSelected:NO];
        [barDeleteButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-delete"] forState:UIControlStateNormal];
    }
};

- (void)deleteButtonPressed:(id)sender{
    UIButton*btn = (UIButton*)sender;
    if (btn.isSelected)
    {
        [btn setSelected:NO];
        [btn setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-delete"] forState:UIControlStateNormal];
        
    }
    else
    {
        [btn setSelected:YES];
        [btn setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-delete-highlighted"] forState:UIControlStateNormal];
        [barInfoButton setSelected:NO];
        [barInfoButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-info"] forState:UIControlStateNormal];
        [barAudioButton setSelected:NO];
        [barAudioButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-audio"] forState:UIControlStateNormal];
        [barShareButton setSelected:NO];
        [barShareButton setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-share"] forState:UIControlStateNormal];
    }
};


// Changing color Status bar to white
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

// Hidding Status bar
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
