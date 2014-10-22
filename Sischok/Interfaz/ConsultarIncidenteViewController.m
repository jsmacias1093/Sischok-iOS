//
//  ConsultarIncidenteViewController.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "ConsultarIncidenteViewController.h"

@interface ConsultarIncidenteViewController ()

@end

@implementation ConsultarIncidenteViewController

@synthesize arryResultadoInc = _arryResultadoInc;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnMenu.target = self.revealViewController;
    self.btnMenu.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.tblResultadoInc.delegate =self;
    self.tblResultadoInc.dataSource = self;
    CentroIncidentes *centroIncidentes = [CentroIncidentes darInstancia];
    self.arryResultadoInc = [centroIncidentes consultarIncidentesPorZonas:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arryResultadoInc.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [ self.tblResultadoInc dequeueReusableCellWithIdentifier:@"incResultado"];
    Incidente * actual = [self.arryResultadoInc objectAtIndex:indexPath.row];
    cell.textLabel.text = actual.titulo;
    cell.detailTextLabel.text = actual.usuarioCreacion;
    return cell;
}



@end
