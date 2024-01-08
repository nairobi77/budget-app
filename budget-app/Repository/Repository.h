//
//  Repository.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 05.01.2024.
//

#import <Foundation/Foundation.h>
#import "TransactionDataModel.h"
#import "ViewController.h"

@interface Repository: NSObject

@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (weak, nonatomic) ViewController *mainViewController;

-(void)saveData:(TransactionDataModel *)transactionalData;
-(NSMutableArray<TransactionDataModel *> *)getData;

@end
