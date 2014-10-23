//
//  VerResultadosIncidentesViewController.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CentroIncidentes.h"
#import "DetalleIncidenteViewController.h"

@interface VerResultadosIncidentesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, MKMapViewDelegate>
@property (strong,nonatomic) NSMutableDictionary* dicIncNuevo;

@property (strong, nonatomic) IBOutlet UITextField *txtIndiceSemanl;
@property (strong, nonatomic) IBOutlet UITextField *txtIndiceGlobal;
@property (strong, nonatomic) IBOutlet UITableView *tblResultadosInc;

@property (strong,nonatomic) NSArray* arryResultado;

@property (strong, nonatomic) IBOutlet MKMapView *mapaDetalleZona;

@end
