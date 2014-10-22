//
//  CentroIncidentes.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "CentroIncidentes.h"

@implementation CentroIncidentes

//------------------------------
//-------Atributos--------------
//------------------------------

static CentroIncidentes * instancia = nil;
@synthesize arryIncidentesServidor = _arryIncidentesServidor;

//------------------------------
//-------Metodos--------------
//------------------------------

+ (CentroIncidentes *) darInstancia{
    if(instancia==nil)
    {
        instancia = [[CentroIncidentes alloc]init];
        [instancia inicializar];
    }
    return instancia;
}

-(void) inicializar
{
    [self configureRestKit];
}

- (NSArray *) darUltimos5Incidentes{
    
     AppDelegate* appdelegate =[AppDelegate sharedAppDelegate];

    return [Incidente darUltimos5Incidentes:[appdelegate managedObjectContext]];
}

- (void) crearIncidente:( NSDictionary *) aAgregar
{
    
}

-(NSArray*) consultarIncidentesPorZonas: (NSString *) deZonas{
    
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//        [manager.requestSerializer setValue:@"image/jpeg" forHTTPHeaderField:@"Content-Type"];
//    
//        [manager POST:@"http://backend-sischok.herokuapp.com/incidentes" parameters:nil constructingBodyWithBlock:^(id formData) {
//        [formData appendPartWithFileData:imageData name:@"avatar" fileName:@"avatar.jpg" mimeType:@"image/jpeg"];
//        } success:^(NSURLSessionDataTask *task, id responseObject) {
//            NSLog(@"success:%@", responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//            NSLog(@"Error:%@", error);
//        }];

//    for (Incidente* inc in self.arryIncidentesServidor) {
//        NSLog(@"titulo: %@, usuario: %@ ",inc.titulo,inc.usuarioCreacion);
//    }
    
    return self.arryIncidentesServidor;
}

- (void) configureRestKit
{
    // initialize AFNetworking HTTPClient
//    NSURL *baseURL = [NSURL URLWithString:@"http://backend-sischok.herokuapp.com/"];
//    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
}

@end
