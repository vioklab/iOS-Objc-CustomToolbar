//
//  ViewController.m
//  Sizes
//
//  Created by bbluue IMac on 2/13/16.
//  Copyright © 2016 bbluue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
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
    
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

@synthesize toolbar, infoPanel, mapView;

float toolBarHeight = 57.5;
float infoPanelHeight = 350.0;
int mapHeight = 265;
int mapSpan = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // SET TOOLBAR
    [self set_imageToolbar];
    
    // SET ICONS SUB NAV
    [self set_infoDisplay];
    
    // MAP VIEW
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    mapView.showsBuildings = YES;
    
    locationManager = [CLLocationManager new];
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [locationManager requestWhenInUseAuthorization];
       
    }
    [locationManager startUpdatingLocation];
    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(mapSpan, self.infoPanel.bounds.size.height-mapHeight, self.infoPanel.bounds.size.width-(mapSpan*2), mapHeight-mapSpan)];
    [infoPanel addSubview:self.mapView];
    
    
}

- (void)set_imageToolbar{
    // TOOLBAR
    toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - toolBarHeight, self.view.frame.size.width, toolBarHeight)];
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



- (void)set_infoDisplay{
    // SUB NAV BAR
    infoPanel = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - (infoPanelHeight+toolBarHeight), self.view.frame.size.width, infoPanelHeight)];
    infoPanel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
    [self.view addSubview:infoPanel];
    
    
    infoPanel.alpha = 0;
    infoPanel.center = CGPointMake(infoPanel.center.x, infoPanel.center.y+(infoPanelHeight/2));
    infoPanel.transform = CGAffineTransformMakeScale(1.0, 0.001);
    
    // ICONS SUB NAV
    UIFont *subNavFont = [UIFont fontWithName:@"Helvetica" size:12.0];
    UIColor *subNavFontColor = [UIColor colorWithRed:0.0/255.0 green:86.0/255.0 blue:120.0/255.0 alpha:1.0];
    
    
    UIImage *imgIco1 = [UIImage imageNamed:@"icons_takephoto-info-date"];
    UIImageView *icoView1 = [[UIImageView alloc] initWithImage:imgIco1];
    icoView1.center = CGPointMake(26, 22);
    UILabel *icoLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(45, 13, 300, 20)];
    icoLabel1.text = @"Wednesday, December 29th, 2015 - 11:00 AM";
    icoLabel1.textColor = subNavFontColor;
    icoLabel1.font = subNavFont;
    
    
    UIImage *imgIco2 = [UIImage imageNamed:@"icons_takephoto-info-cloud"];
    UIImageView *icoView2 = [[UIImageView alloc] initWithImage:imgIco2];
    icoView2.center = CGPointMake(26, 55);
    UILabel *icoLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(45, 46, 200, 20)];
    icoLabel2.text = @"Synchronized";
    icoLabel2.textColor = subNavFontColor;
    icoLabel2.font = subNavFont;
    
    
    UIImage *imgIco3 = [UIImage imageNamed:@"icons_takephoto-info-mb"];
    UIImageView *icoView3 = [[UIImageView alloc] initWithImage:imgIco3];
    icoView3.center = CGPointMake(160, 54);
    UILabel *icoLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(180, 46, 200, 20)];
    icoLabel3.text = @"20.5 Mb";
    icoLabel3.textColor = subNavFontColor;
    icoLabel3.font = subNavFont;
    
    NSArray *iconSubArray;
    iconSubArray = [NSArray arrayWithObjects: icoView1, icoView2, icoView3,  nil];
    for (int i = 0; i < [iconSubArray count]; i++) {
        [infoPanel addSubview:iconSubArray[i]];
    }
    
    NSArray *LabelsIconsSubArray;
    LabelsIconsSubArray = [NSArray arrayWithObjects: icoLabel1, icoLabel2, icoLabel3,  nil];
    for (int i = 0; i < [LabelsIconsSubArray count]; i++) {
        //[LabelsIconsSubArray[i] fontAttributes:]
        [infoPanel addSubview:LabelsIconsSubArray[i]];
    }

}

- (void)infoButtonPressed:(id)sender{
    UIButton*btn = (UIButton*)sender;
    if (btn.isSelected)
    {
        [btn setSelected:NO];
        [btn setBackgroundImage:[UIImage imageNamed:@"icons_takephoto-toolbar-info"] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.2 animations:^{
            infoPanel.alpha = 0;
            infoPanel.center = CGPointMake(infoPanel.center.x, infoPanel.center.y+(infoPanelHeight/2));
            infoPanel.transform = CGAffineTransformMakeScale(1.0, 0.001);
            
        } completion:nil];
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
        // animation
        [UIView animateWithDuration:0.2 animations:^{
            infoPanel.alpha = 1;
            infoPanel.center = CGPointMake(infoPanel.center.x, infoPanel.center.y-(infoPanelHeight/2));
            infoPanel.transform = CGAffineTransformMakeScale(1.0, 1.0);
            
        } completion:nil];
        
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
