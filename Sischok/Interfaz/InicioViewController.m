//
//  InicioViewController.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "InicioViewController.h"
#import "DetalleIncidenteViewController.h"
#import "Incidente.h"
#import "CentroIncidentes.h"

@implementation InicioViewController

@synthesize arryUltimosIncidentes = _arryUltimosIncidentes;

- (void)viewDidLoad {
    [super viewDidLoad];
    //inicializar arreglo
    self.bntMenu.target = self.revealViewController;
    self.bntMenu.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.tblUltimosIncidentes.delegate = self;
    self.tblUltimosIncidentes.dataSource = self;
    
    
    
    self.mapaInicio.delegate = self;
    self.mapaInicio.showsUserLocation = YES;
    CLLocationCoordinate2D coordenadaBogota = CLLocationCoordinate2DMake(4.598889, -74.080833);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (coordenadaBogota, 15000, 15000);
    [self.mapaInicio setRegion:region animated:NO];
    
    CentroIncidentes * centroIncidentes = [CentroIncidentes darInstancia];
    self.arryUltimosIncidentes = [centroIncidentes darUltimos5Incidentes];
}

-(void)viewDidAppear:(BOOL)animated
{
    CentroIncidentes * centroIncidentes = [CentroIncidentes darInstancia];
    self.arryUltimosIncidentes = [centroIncidentes darUltimos5Incidentes];
    [self.tblUltimosIncidentes reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arryUltimosIncidentes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [ self.tblUltimosIncidentes dequeueReusableCellWithIdentifier:@"idInc"];
    Incidente * actual = [self.arryUltimosIncidentes objectAtIndex:indexPath.row];
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(actual.latitud.doubleValue, actual.longitud.doubleValue);
    point.title = actual.titulo;
    [self.mapaInicio addAnnotation:point];
    cell.textLabel.text = actual.titulo;
    cell.detailTextLabel.text = actual.usuarioCreacion;
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"DetalleIncInico"])
    {
        Incidente *incO = [self.arryUltimosIncidentes objectAtIndex:[self.tblUltimosIncidentes indexPathForSelectedRow].row];
        DetalleIncidenteViewController *viewC = [segue destinationViewController];
        viewC.title = incO.titulo;
        viewC.objInc = incO;
    }

}

@end
