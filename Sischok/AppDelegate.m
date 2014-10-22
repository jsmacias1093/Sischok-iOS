//
//  AppDelegate.m
//  Sischok
//
//  Created by Juan Sebastian Macias Quintero on 21/10/14.
//  Copyright (c) 2014 Sischok inc. All rights reserved.
//

#import "AppDelegate.h"
#import "Incidente.h"
#import <RestKit/RestKit.h>


@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray *rutaS = NSSearchPathForDirectoriesInDomains (NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *rutaPlistDirectorio =  [[rutaS objectAtIndex:0] stringByAppendingPathComponent:@"Preference"];
    NSString *rutaPlist =  [[rutaS objectAtIndex:0] stringByAppendingPathComponent:@"Preference/propiedadesUsuario.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:rutaPlist]) {
        NSError *error3;
        [[NSFileManager defaultManager] createDirectoryAtPath:rutaPlistDirectorio withIntermediateDirectories:NO attributes:nil error:&error3];
        NSString *rutaPlistN = [[NSBundle mainBundle] pathForResource:@"propiedadesUsuario" ofType:@"plist"];
        NSError *error;
        NSData *dataplist=[[NSFileManager defaultManager] contentsAtPath:rutaPlistN];
        NSPropertyListFormat format;
        NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListWithData:dataplist options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
        if (!temp)
        {
           
        }
        else
        {

            NSString* rutaJSON =[[NSBundle mainBundle] pathForResource:@"incidentesbasicos" ofType:@"json"];
            dataplist=[[NSFileManager defaultManager] contentsAtPath:rutaJSON];
            NSDictionary* JSONPadre = [NSJSONSerialization JSONObjectWithData:dataplist options: NSJSONReadingMutableContainers error:&error];
            NSArray* JSONArryInc = [JSONPadre objectForKey:@"Incidentes"];
            for (NSDictionary* incActual in JSONArryInc) {
                Incidente* nuevo = [NSEntityDescription insertNewObjectForEntityForName:@"Incidente" inManagedObjectContext:[self managedObjectContext]];
                nuevo.titulo = [incActual objectForKey:@"titulo"];
                nuevo.descripcion = [incActual objectForKey:@"descripcion"];
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
                nuevo.zona = [formatter numberFromString:([incActual objectForKey:@"zona"])];
                nuevo.gravedad = [formatter numberFromString:([incActual objectForKey:@"gravedad"])];
                nuevo.usuarioCreacion = [incActual objectForKey:@"usuarioCreacion"];
                nuevo.idServidor = [incActual objectForKey:@"idServidor"];
                nuevo.fechaCreacion = [[NSDate alloc] init];
                nuevo.latitud = [formatter numberFromString:([incActual objectForKey:@"latitud"])];
                nuevo.longitud = [formatter numberFromString:([incActual objectForKey:@"longitud"])];
                NSError*error2;
                [[self managedObjectContext] save:&error2];
            }
            
            [temp setValue:@"YES" forKey:@"dbIniciada"];
            NSError*error1;
            NSData *plistData = [NSPropertyListSerialization dataWithPropertyList: temp format:format options:NSPropertyListXMLFormat_v1_0 error:&error1];
            if(plistData) {
               [[NSFileManager defaultManager] createFileAtPath:rutaPlist contents:plistData attributes:nil];
            }
            else {
                NSLog(@"error1 : %@",error1);
            }
            
        }

    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "co.uniandes.Sischok" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Sischok" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Sischok.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
