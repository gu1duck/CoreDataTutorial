//
//  AppDelegate.m
//  CoreData
//
//  Created by Jeremy Petter on 2015-05-24.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
//    
//    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
//    NSManagedObject* newPerson = [[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.managedObjectContext];
    
//    [newPerson setValue:@"Bart" forKey:@"first"];
//    [newPerson setValue:@"Simpson" forKey:@"last"];
//    [newPerson setValue:@10 forKey: @"age"];
//    
//    NSEntityDescription* entityAddress = [NSEntityDescription entityForName:@"Address" inManagedObjectContext:self.managedObjectContext];
//    NSManagedObject *newAddress = [[NSManagedObject alloc] initWithEntity:entityAddress insertIntoManagedObjectContext:self.managedObjectContext];
//    [newAddress setValue:@"Main Street" forKey:@"street"];
//    [newAddress setValue:@"Boston" forKey:@"city"];
//    
//    [newPerson setValue:[NSSet setWithObject:newAddress] forKey:@"addresses"];
//    
//    NSManagedObject *otherAddress = [[NSManagedObject alloc]initWithEntity:entityAddress insertIntoManagedObjectContext:self.managedObjectContext];
//    
//    [otherAddress setValue:@"5th Avenue" forKey:@"street"];
//    [otherAddress setValue:@"New York" forKey:@"city"];
//    
//    NSMutableSet *addresses = [newPerson mutableSetValueForKeyPath:@"addresses"];
//    [addresses addObject:otherAddress];
//    
//    [newPerson setValue:nil forKey:@"addresses"];
//    
//     NSManagedObject* anotherPerson = [[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.managedObjectContext];
//    [anotherPerson setValue:@"Jane" forKey:@"first"];
//    [anotherPerson setValue:@"Doe" forKey:@"last"];
//    [anotherPerson setValue:@42 forKey:@"age"];
//    
//    [newPerson setValue:anotherPerson forKey:@"spouse"];
//    
//    
//    NSManagedObject *newChildPerson = [[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.managedObjectContext];
//    
//    [newChildPerson setValue:@"Jim" forKey:@"first"];
//    [newChildPerson setValue:@"Doe" forKey:@"last"];
//    [newChildPerson setValue:@21 forKey:@"age"];
//    
//    NSMutableSet *children = [newPerson mutableSetValueForKey:@"children"];
//    [children addObject:newChildPerson];
//    
//    NSManagedObject *anotherChildPerson = [[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.managedObjectContext];
//    
//    [anotherChildPerson setValue:@"Lucy" forKey:@"first"];
//    [anotherChildPerson setValue:@"Doe" forKey:@"last"];
//    [anotherChildPerson setValue:@19 forKey:@"age"];
//    
//    [anotherChildPerson setValue:newPerson forKeyPath:@"father"];
//    
//    
//    NSError* error = nil;
//    if (![newPerson.managedObjectContext save:&error]){
//        NSLog(@"Unable to save managed object context.");
//        NSLog(@"%@, %@", error, error.localizedDescription);
//    }
    
//    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
//    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"first" ascending:YES];
//    NSSortDescriptor *sortDescriptor1 = [NSSortDescriptor sortDescriptorWithKey:@"last" ascending:YES];
//    NSSortDescriptor *sortDescriptor2 = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
//
//
//    [fetchRequest setSortDescriptors:@[sortDescriptor1, sortDescriptor2]];
//    
//    NSError *fetchError = nil;
//    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
//    if (!fetchError){
//        for (NSManagedObject* managedObject in result){
//            NSLog(@"%@, %@", [managedObject valueForKey:@"first"], [managedObject valueForKey:@"last"]);
//        }
//    } else {
//        NSLog(@"Error fetching data.");
//        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
//    }
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[c] %@ AND %K >= %@", @"first", @"j", @"age", @20];
    
    
    NSSortDescriptor *sortDescriptor1 = [NSSortDescriptor sortDescriptorWithKey:@"last" ascending:YES];
    NSSortDescriptor *sortDescriptor2 = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor1, sortDescriptor2]];
    [fetchRequest setPredicate:predicate];

    NSError *fetchError = nil;
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    if (!fetchError){
        for (NSManagedObject* managedObject in result){
            NSLog(@"%@, %@", [managedObject valueForKey:@"first"], [managedObject valueForKey:@"last"]);
        }
    } else {
        NSLog(@"Error fetching data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }

    
    // Override point for customization after application launch.
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
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.jeremypetter.CoreData" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreData" withExtension:@"momd"];
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
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreData.sqlite"];
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
