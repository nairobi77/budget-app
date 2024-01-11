//
//  TransactionDataModelStruct.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import "TransactionDataModel.h"


NSString *const objectIdKey = @"objectId";
NSString *const dateKey = @"date";
NSString *const amountKey = @"amount";
NSString *const typeKey = @"type";


@implementation TransactionDataModel
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeInteger:self.objectId forKey:objectIdKey];
    [coder encodeObject:self.date forKey:dateKey];
    [coder encodeObject:self.amount forKey:amountKey];
    [coder encodeObject:self.type forKey:typeKey];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder { 
    self = [super init];
    if (self) {
        _objectId = [coder decodeIntegerForKey:objectIdKey];
        _date = [coder decodeObjectForKey:dateKey];
        _amount = [coder decodeObjectForKey:amountKey];
        _type = [coder decodeObjectForKey:typeKey];
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}
@end
