//
//  Incidente+Crear.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "Incidente+Crear.h"

@implementation Incidente (Crear)

+ (void) crearIncidente:(Incidente *) aAgregar conContexto:(NSManagedObjectContext *) contexto{
    
//    Incidente * nuevaPrenda = [NSEntityDescription insertNewObjectForEntityForName: @"Incidente" inManagedObjectContext:contexto];

    
}

+ (NSArray* ) darUltimos5Incidentes:(NSManagedObjectContext *) contexto{
    NSFetchRequest *fecher = [NSFetchRequest fetchRequestWithEntityName:@"Incidente"];
    fecher.fetchLimit = 5;
    NSError *errorPaila = nil;
    NSArray * arr = [contexto executeFetchRequest:fecher error:&errorPaila];
    NSLog(@"error: %@",errorPaila.description);
    return arr;
}

@end
