//
//  CentroIncidentes.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Incidente.h"
#import "Incidente+Crear.h"
#import "AppDelegate.h"
#import <RestKit/RestKit.h>
#import "AFHTTPSessionManager.h"


@interface CentroIncidentes : NSObject

@property (strong,nonatomic) NSArray* arryIncidentesServidor;

+ (CentroIncidentes *) darInstancia;

- (NSArray *) darUltimos5Incidentes;

- (void) crearIncidente:( NSDictionary *) aAgregar;

-(NSArray*) consultarIncidentesPorZonas: (NSString *) deZonas;


@end
