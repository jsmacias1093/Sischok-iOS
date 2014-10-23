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
    NSString* rutaJSON =[[NSBundle mainBundle] pathForResource:@"localidades" ofType:@"json"];
    NSData * dataplist=[[NSFileManager defaultManager] contentsAtPath:rutaJSON];
    NSError*error;
    self.arryResultadoInc = [[NSJSONSerialization JSONObjectWithData:dataplist options: NSJSONReadingMutableContainers error:&error] objectForKey:@"localidades"];
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
    NSMutableDictionary * dicBarrio = [self.arryResultadoInc objectAtIndex:indexPath.row];
    cell.textLabel.text = [dicBarrio objectForKey:@"nombre"];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detalleZona"])
    {
        NSInteger rowIn = [self.tblResultadoInc indexPathForSelectedRow].row;
        NSMutableDictionary *dicBarrioSeleccionado = [self.arryResultadoInc objectAtIndex:rowIn];
        NSString* strZona = [NSString stringWithFormat:@"%ld", rowIn ];
        [dicBarrioSeleccionado setValue: strZona forKey:@"zona"];
        VerResultadosIncidentesViewController * objProximaVista = [segue destinationViewController];
        objProximaVista.title = [dicBarrioSeleccionado objectForKey:@"nombre"];
        objProximaVista.dicIncNuevo = dicBarrioSeleccionado;
    }
}



@end
