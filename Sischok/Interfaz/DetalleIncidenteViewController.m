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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
