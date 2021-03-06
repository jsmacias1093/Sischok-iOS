//
//  DetalleIncidenteViewController.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Incidente.h"

@interface DetalleIncidenteViewController : UIViewController<MKMapViewDelegate>

@property (strong,nonatomic) Incidente * objInc;
@property (strong, nonatomic) IBOutlet UITextField *txtDescripcion;
@property (strong, nonatomic) IBOutlet UITextField *txtGravedad;
@property (strong, nonatomic) IBOutlet UITextField *txtUsuario;
@property (strong, nonatomic) IBOutlet UITextField *txtFecha;
@property (strong, nonatomic) IBOutlet MKMapView *mapaDetalleInc;

@end
