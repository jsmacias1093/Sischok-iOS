//
//  Incidente+Crear.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "Incidente+Crear.h"

@implementation Incidente (Crear)

+ (void) crearIncidente:(NSDictionary *) aAgregar conContexto:(NSManagedObjectContext *) contexto{
    
    Incidente * nuevaPrenda = [NSEntityDescription insertNewObjectForEntityForName: @"Incidente" inManagedObjectContext:contexto];
    nuevaPrenda.titulo = [aAgregar objectForKey:@"titulo"];
    nuevaPrenda.descripcion = [aAgregar objectForKey:@"descripcion"];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    nuevaPrenda.zona = [formatter numberFromString:([aAgregar objectForKey:@"zona"])];
    nuevaPrenda.gravedad = [formatter numberFromString:([aAgregar objectForKey:@"gravedad"])];
    nuevaPrenda.usuarioCreacion = [aAgregar objectForKey:@"usuarioCreacion"];
    nuevaPrenda.idServidor = @"";
    nuevaPrenda.fechaCreacion = [[NSDate alloc] init];
    nuevaPrenda.latitud = [aAgregar objectForKey:@"latitud"];
    nuevaPrenda.longitud =  [aAgregar objectForKey:@"longitud"];
    [contexto save:nil];
    
}

+ (NSArray* ) darUltimos5Incidentes:(NSManagedObjectContext *) contexto{
    NSFetchRequest *fecher = [NSFetchRequest fetchRequestWithEntityName:@"Incidente"];
    fecher.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"fechaCreacion" ascending:FALSE]];
    fecher.fetchLimit = 5;
    NSError *errorPaila = nil;
    NSArray * arr = [contexto executeFetchRequest:fecher error:&errorPaila];
    return arr;
}

+ (double) indiceDeAccidentalidad :(NSInteger) zona conContexto:(NSManagedObjectContext*) contexto
{
    NSFetchRequest *fecher = [NSFetchRequest fetchRequestWithEntityName:@"Incidente"];
    fecher.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"fechaCreacion" ascending:FALSE]];
    fecher.predicate = [NSPredicate predicateWithFormat:@"zona=%ld",zona];
    NSError *errorPaila = nil;
    NSArray * arr = [contexto executeFetchRequest:fecher error:&errorPaila];
    double sumatotal = 0;
    int totalIncidnetes= (int)arr.count;
    for (Incidente*inc in arr) {
        sumatotal+=inc.gravedad.unsignedIntegerValue;
    }
    double d = sumatotal/(totalIncidnetes*5);
    return d;
}

+ (NSArray*) darIncidentesPorZona :(NSInteger) zona conContexto:(NSManagedObjectContext*) contexto
{
    NSFetchRequest *fecher = [NSFetchRequest fetchRequestWithEntityName:@"Incidente"];
    fecher.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"fechaCreacion" ascending:FALSE]];
    fecher.predicate = [NSPredicate predicateWithFormat:@"zona=%ld",zona];
    NSError *errorPaila = nil;
    NSArray * arr = [contexto executeFetchRequest:fecher error:&errorPaila];
    return arr;
}

@end
