//
//  CrearIncidenteBarriosViewController.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "CrearIncidenteBarriosViewController.h"

@interface CrearIncidenteBarriosViewController ()

@end

@implementation CrearIncidenteBarriosViewController

@synthesize arryBarrios = _arryBarrios;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnMenu.target = self.revealViewController;
    self.btnMenu.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.tblBarrios.delegate = self;
    self.tblBarrios.dataSource = self;
    NSString* rutaJSON =[[NSBundle mainBundle] pathForResource:@"localidades" ofType:@"json"];
    NSData * dataplist=[[NSFileManager defaultManager] contentsAtPath:rutaJSON];
    NSError*error;
    self.arryBarrios = [[NSJSONSerialization JSONObjectWithData:dataplist options: NSJSONReadingMutableContainers error:&error] objectForKey:@"localidades"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arryBarrios.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.tblBarrios dequeueReusableCellWithIdentifier:@"localidad"];
    NSDictionary * dicBarrio = [self.arryBarrios objectAtIndex:indexPath.row];
    cell.textLabel.text = [dicBarrio objectForKey:@"nombre"];
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detalleDescripcion"])
    {
        NSInteger rowIn = [self.tblBarrios indexPathForSelectedRow].row;
        NSMutableDictionary *dicBarrioSeleccionado = [self.arryBarrios objectAtIndex:rowIn];
        NSString* strZona = [NSString stringWithFormat:@"%ld", rowIn ];
        [dicBarrioSeleccionado setValue: strZona forKey:@"zona"];
        CrearIncidenteDescripcionViewController* objProximaVista = [segue destinationViewController];
        objProximaVista.dicIncNuevo = dicBarrioSeleccionado;
    }
}


@end
