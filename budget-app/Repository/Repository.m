//
//  Repository.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 05.01.2024.
//

#import <Foundation/Foundation.h>
#import "Repository.h"

@implementation Repository


- (id)init {
    self = [super init];
    if (self) {
        self.dataCollection = self.dataModelCollection;
    }
    return self;
}

- (void)saveData:(TransactionDataModel *)data {
    // implement later
}

- (NSArray<TransactionDataModel *> *)getData {
    return self.dataCollection;
}

-(NSArray<TransactionDataModel*>*)dataModelCollection {
    NSMutableArray<TransactionDataModel *> *collection = [[NSMutableArray alloc] init];
    for(NSInteger i = 0; i < 100; i++) {
        TransactionDataModel* data = [[TransactionDataModel alloc] init];
        [data setObjectId: i];
        [data setDate: @"27.12.2023"];
        [data setAmount: [NSString stringWithFormat:@"%ld", (long)i]];
        data.type = @"shop";
        [collection addObject:data];
    };
   
    return collection;
}
@end
