//
//  TransactionDataModelStruct.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import "TransactionDataModel.h"

@implementation TransactionDataModel
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeInteger:self.objectId forKey:@"objectId"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.amount forKey:@"amount"];
    [coder encodeObject:self.type forKey:@"type"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder { 
    self = [super init];
    if (self) {
        _objectId = [coder decodeIntegerForKey:@"objectId"];
        _date = [coder decodeObjectForKey:@"date"];
        _amount = [coder decodeObjectForKey:@"amount"];
        _type = [coder decodeObjectForKey:@"type"];
    }
    return self;
}

@end
