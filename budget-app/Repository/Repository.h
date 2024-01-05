//
//  Repository.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 05.01.2024.
//

#import <Foundation/Foundation.h>
#import "TransactionDataModel.h"

@interface Repository: NSObject
-(void)saveData:(TransactionDataModel *)transactionalData;
-(NSMutableArray<TransactionDataModel *> *)getData;
@end
