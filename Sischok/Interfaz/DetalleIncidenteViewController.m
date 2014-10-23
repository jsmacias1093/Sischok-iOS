//
//  DetalleIncidenteViewController.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "DetalleIncidenteViewController.h"

@interface DetalleIncidenteViewController ()

@end


@implementation DetalleIncidenteViewController

@synthesize objInc = _objInc;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtDescripcion.text = self.objInc.descripcion;
    self.txtGravedad.text = [NSString stringWithFormat:@"%@",self.objInc.gravedad];
    self.txtUsuario.text = self.objInc.usuarioCreacion;
    self.txtFecha.text = self.objInc.fechaCreacion.description;
    self.mapaDetalleInc.delegate = self;
    CLLocationCoordinate2D coordenadaInc = CLLocationCoordinate2DMake(self.objInc.latitud.doubleValue, self.objInc.longitud.doubleValue);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (coordenadaInc, 2000, 2000);
    [self.mapaDetalleInc setRegion:region animated:NO];
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(self.objInc.latitud.doubleValue, self.objInc.longitud.doubleValue);
    point.title = self.objInc.titulo;
    point.subtitle = [[NSString alloc]initWithFormat:@"Zona: %d",self.objInc.zona.intValue];
    [self.mapaDetalleInc addAnnotation:point];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
