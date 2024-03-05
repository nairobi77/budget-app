//
//  Repository.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 05.01.2024.
//

#import <Foundation/Foundation.h>
#import "TransactionDataModel.h"
#import "ViewController.h"
#import "CoreData/CoreData.h"
#import "AppDelegate.h"

@interface Repository: NSObject

@property (strong, nonatomic) NSManagedObjectContext* mangedContext;

-(void)saveData:(TransactionDataModel *)transactionalData;
-(NSMutableArray<TransactionDataModel *> *)getData;

@end
