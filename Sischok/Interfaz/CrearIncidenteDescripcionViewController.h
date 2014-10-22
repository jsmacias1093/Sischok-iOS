//
//  CrearIncidenteDescripcionViewController.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Incidente.h"

@interface CrearIncidenteDescripcionViewController : UIViewController

@property (strong,nonatomic) NSDictionary* dicIncNuevo;
@property (strong, nonatomic) IBOutlet UITextField *txtTitulo;
@property (strong, nonatomic) IBOutlet UITextField *txtDescripcion;
@property (strong, nonatomic) IBOutlet UITextField *txtGravedad;
@property (strong, nonatomic) IBOutlet UIView *vistaContenida;
- (IBAction)crearIncidnete:(id)sender;

@end
