//
//  VerResultadosIncidentesViewController.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "VerResultadosIncidentesViewController.h"

@interface VerResultadosIncidentesViewController ()

@end

@implementation VerResultadosIncidentesViewController

@synthesize arryResultado =_arryResultado;
@synthesize dicIncNuevo = _dicIncNuevo;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tblResultadosInc.delegate = self;
    self.tblResultadosInc.dataSource = self;
    CentroIncidentes *centro = [CentroIncidentes darInstancia];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSInteger zona = [formatter numberFromString:([self.dicIncNuevo objectForKey:@"zona"])].unsignedIntegerValue;
    self.arryResultado = [centro darIncidentesPorZona:zona];
    double indice = [centro indiceDeAccidentalidad:zona];
    if (indice !=NAN) {
        self.txtIndiceSemanl.text = [[NSString alloc] initWithFormat:@"%f",[centro indiceDeAccidentalidad:zona]];
        self.txtIndiceGlobal.text = [[NSString alloc] initWithFormat:@"%f",[centro indiceDeAccidentalidad:zona]];
    }
    self.mapaDetalleZona.delegate = self;
    CLLocationCoordinate2D coordenadaInc = CLLocationCoordinate2DMake(((NSNumber*)[self.dicIncNuevo objectForKey:@"latitud"]).doubleValue, ((NSNumber*)[self.dicIncNuevo objectForKey:@"longitud"]).doubleValue);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (coordenadaInc, 6000, 6000);
    [self.mapaDetalleZona setRegion:region animated:NO];
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordenadaInc;
    point.title = self.title;
    [self.mapaDetalleZona addAnnotation:point];
    [self.mapaDetalleZona selectAnnotation:point animated:YES];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arryResultado.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [ self.tblResultadosInc dequeueReusableCellWithIdentifier:@"IncsZona"];
    Incidente * actual = [self.arryResultado objectAtIndex:indexPath.row];
    cell.textLabel.text = actual.titulo;
    cell.detailTextLabel.text = actual.usuarioCreacion;
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"destalleINcZona"])
    {
        Incidente *incO = [self.arryResultado objectAtIndex:[self.tblResultadosInc indexPathForSelectedRow].row];
        DetalleIncidenteViewController *viewC = [segue destinationViewController];
        viewC.title = incO.titulo;
        viewC.objInc = incO;
    }
    
}

@end
