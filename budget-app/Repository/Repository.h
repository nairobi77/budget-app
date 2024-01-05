//
//  Repository.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 05.01.2024.
//

#import <Foundation/Foundation.h>
#import "TransactionDataModel.h"

@interface Repository: NSObject
@property (nonatomic, strong) NSArray *dataCollection;
-(void)saveData:(TransactionDataModel *)data;
-(NSArray<TransactionDataModel *> *)getData;
@end
