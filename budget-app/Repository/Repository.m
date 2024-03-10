//
//  Repository.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 05.01.2024.
//

#import <Foundation/Foundation.h>
#import "Repository.h"

@interface Repository ()

@property (strong, nonatomic) NSManagedObjectContext* mangedContext;
@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

-(void)saveContext;

@end

@implementation Repository

-(instancetype)init {
    self = [super init];
    if (self) {
        self.mangedContext = [self.persistentContainer viewContext];
    }
    return self;
}

-(void)saveData:(TransactionDataModel *)transactionalData {
    
    NSManagedObject* transaction = [NSEntityDescription insertNewObjectForEntityForName:@"DataModel"
                                                                 inManagedObjectContext:self.mangedContext];
    
    [transaction setValue:[NSDate now] forKey:@"date"];
    [transaction setValue:transactionalData.amount forKey:@"amount"];
    [transaction setValue:transactionalData.type forKey:@"type"];
    
    NSError* error = nil;
    if(![self.mangedContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
}

- (NSMutableArray<TransactionDataModel *> *)getData {

    NSFetchRequest* request = [NSFetchRequest new];
    NSEntityDescription* description = [NSEntityDescription entityForName:@"DataModel"
                                                   inManagedObjectContext:self.mangedContext];
    [request setEntity:description];
    NSError* error = nil;
    NSArray* resultArray = [self.mangedContext executeFetchRequest:request error:&error];
    NSMutableArray<TransactionDataModel *> *storedObjects = [NSMutableArray new];
    
    for (NSManagedObject * object in resultArray) {
        TransactionDataModel *dataModel = [TransactionDataModel new];
        dataModel.date = [object valueForKey:@"date"];
        dataModel.amount = [object valueForKey:@"amount"];
        dataModel.type = [object valueForKey:@"type"];
        [storedObjects addObject: dataModel];
    }
    return storedObjects;
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentCloudKitContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentCloudKitContainer alloc] initWithName:@"BudgetAppDataModel"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
@end
