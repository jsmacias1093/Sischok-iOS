//
//  Incidente.h
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Incidente : NSManagedObject

@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSNumber * zona;
@property (nonatomic, retain) NSNumber * gravedad;
@property (nonatomic, retain) NSString * usuarioCreacion;
@property (nonatomic, retain) NSString * idServidor;
@property (nonatomic, retain) NSDate * fechaCreacion;
@property (nonatomic, retain) NSNumber * latitud;
@property (nonatomic, retain) NSNumber * longitud;

@end
