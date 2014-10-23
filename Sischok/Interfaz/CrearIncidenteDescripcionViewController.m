//
//  CrearIncidenteDescripcionViewController.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "CrearIncidenteDescripcionViewController.h"

@interface CrearIncidenteDescripcionViewController ()

@end

@implementation CrearIncidenteDescripcionViewController

@synthesize dicIncNuevo = _dicIncNuevo;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.txtDescripcion resignFirstResponder];
}



- (IBAction)crearIncidnete:(id)sender {
    CentroIncidentes *centro =[CentroIncidentes darInstancia];
    [self.dicIncNuevo setObject:self.txtTitulo.text forKey:@"titulo"];
    [self.dicIncNuevo setObject:self.txtDescripcion.text forKey:@"descripcion"];
    [self.dicIncNuevo setObject:self.txtGravedad.text forKey:@"gravedad"];
    [self.dicIncNuevo setObject:@"Dispositivo iPhone" forKey:@"usuarioCreacion"];
    [centro crearIncidente:self.dicIncNuevo];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Exitoso"
                                                    message:@"Se creo el incidente"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];    
}
@end
