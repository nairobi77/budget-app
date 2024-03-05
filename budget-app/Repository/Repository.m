//
//  Repository.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 05.01.2024.
//

#import <Foundation/Foundation.h>
#import "Repository.h"

@implementation Repository

-(instancetype)init {
    self = [super init];
    if (self) {
        AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        self.mangedContext = [[appDelegate persistentContainer] viewContext];
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

@end
