//
//  ConsultarIncidenteViewController.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "CentroIncidentes.h"

@interface ConsultarIncidenteViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnMenu;
@property (strong, nonatomic) IBOutlet UITableView *tblResultadoInc;

@property(strong,nonatomic) NSArray* arryResultadoInc;

@end
