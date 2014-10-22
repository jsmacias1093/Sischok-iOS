//
//  MenuLateralViewController.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuLateralViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tablaOpciones;
@property (strong,nonatomic) NSArray*menu;
@end
