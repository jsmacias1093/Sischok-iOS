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

- (BOOL) crearIncidente:( NSDictionary *) aAgregar
{
//            BackendRestClient *manager = [BackendRestClient sharedClient];
//            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/JSON"];
//            [manager.requestSerializer setValue:@"application/JSON" forHTTPHeaderField:@"Content-Type"];
//            NSError *error;
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:aAgregar
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&error];
//            NSString * JSONInc = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding ];
//            [manager POST:@"http://backend-sischok.herokuapp.com/incidentes" parameters:JSONInc constructingBodyWithBlock:^(id formData) {
//            } success:^(NSURLSessionDataTask *task, id responseObject) {
//                NSLog(@"success:%@", responseObject);
//                NSError* error;
//                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:aAgregar
//                                                                   options:NSJSONWritingPrettyPrinted
//                                                                     error:&error];
//                
//                NSDictionary* JSONPadre = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error:&error];
//                
//            }
//        failure:^(NSURLSessionDataTask *task, NSError *error) {
//                NSLog(@"Error:%@", error);
//        }];
    
    
    AppDelegate* appdelegate =[AppDelegate sharedAppDelegate];
    [Incidente crearIncidente: aAgregar conContexto:[appdelegate managedObjectContext]];
    return true;
}

-(double) indiceDeAccidentalidad :(NSInteger) zona
{
    AppDelegate* appdelegate =[AppDelegate sharedAppDelegate];
    return [Incidente indiceDeAccidentalidad:zona conContexto:[appdelegate managedObjectContext]];
}



- (NSArray*) darIncidentesPorZona :(NSInteger) zona
{
    AppDelegate* appdelegate =[AppDelegate sharedAppDelegate];
    return [Incidente darIncidentesPorZona:zona conContexto:[appdelegate managedObjectContext]];
            
            }


- (void) configureRestKit
{
    // initialize AFNetworking HTTPClient
//    NSURL *baseURL = [NSURL URLWithString:@"http://backend-sischok.herokuapp.com/"];
//    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
}

@end
