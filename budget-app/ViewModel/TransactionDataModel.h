//
//  TransactionDataModel.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import <Foundation/Foundation.h>

@interface TransactionDataModel : NSObject

@property (strong, nonatomic, nullable) NSDate *date;
@property (strong, nonatomic, nullable) NSDecimalNumber *amount;
@property (strong, nonatomic, nullable) NSString *type;

@end
