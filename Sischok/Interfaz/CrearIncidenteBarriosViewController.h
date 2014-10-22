//
//  CrearIncidenteBarriosViewController.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "CrearIncidenteDescripcionViewController.h"

@interface CrearIncidenteBarriosViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnMenu;
@property (strong, nonatomic) IBOutlet UITableView *tblBarrios;
@property (strong,nonatomic) NSArray * arryBarrios;

@end
