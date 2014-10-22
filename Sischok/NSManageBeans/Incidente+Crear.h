//
//  Incidente+Crear.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "Incidente.h"

@interface Incidente (Crear)

+ (void) crearIncidente:(Incidente *) aAgregar conContexto:(NSManagedObjectContext *) contexto;

+ (NSArray* ) darUltimos5Incidentes: (NSManagedObjectContext *) contexto;

@end
