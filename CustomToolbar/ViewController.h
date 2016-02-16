//
//  ViewController.h
//  Sizes
//
//  Created by bbluue IMac on 2/13/16.
//  Copyright © 2016 bbluue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
    
}
    @property(strong, nonatomic) UIToolbar *toolbar;
    @property(strong, nonatomic) UIView *infoPanel;
    @property(strong, nonatomic) MKMapView *mapView;
   
@end

