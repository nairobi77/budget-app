//
//  Repository.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 05.01.2024.
//

#import <Foundation/Foundation.h>
#import "Repository.h"

@implementation Repository

-(id)init {
    self = [super init];
    self.dateFormatter = [self makeDateFormatter];
    return self;
}

-(void)saveData:(TransactionDataModel *)transactionalData {
    NSMutableArray<TransactionDataModel *> *existingObjects = self.getData;
    if (!existingObjects) {
        existingObjects = [NSMutableArray array];
    }
    NSString *date = [self.dateFormatter stringFromDate:[NSDate now]];
    transactionalData.date = date;
    [existingObjects addObject:transactionalData];

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:existingObjects requiringSecureCoding:NO error:nil];
    [data writeToFile:self.filePath atomically:YES];
    NSMutableArray<TransactionDataModel *> *actualData = self.getData;
    [self.view update: actualData];

}

- (NSMutableArray<TransactionDataModel *> *)getData {
    NSData *data = [NSData dataWithContentsOfFile:self.filePath];
    NSError *error = nil;
    NSSet *set = [NSSet setWithArray:@[
                          [NSMutableArray class],
                          [TransactionDataModel class],
                          [NSString class]
                          ]];
    NSMutableArray<TransactionDataModel *> *storedObjects = [NSKeyedUnarchiver unarchivedObjectOfClasses:set
                                                                                                fromData:data
                                                                                                   error:&error];
    return storedObjects;
}

- (NSString *)filePath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"TransactionData_4.archive"];
}

-(NSDateFormatter *)makeDateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateStyle: NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle: NSDateFormatterShortStyle];
    return dateFormatter;
}


@end
