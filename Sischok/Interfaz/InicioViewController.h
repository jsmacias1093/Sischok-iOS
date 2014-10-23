//
//  InicioViewController.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import <MapKit/MapKit.h>



@interface InicioViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tblUltimosIncidentes;
@property (strong,nonatomic) NSArray* arryUltimosIncidentes;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *bntMenu;
@property (strong, nonatomic) IBOutlet MKMapView *mapaInicio;


@end
