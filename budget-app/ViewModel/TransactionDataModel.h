//
//  TransactionDataModel.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import <Foundation/Foundation.h>

@interface TransactionDataModel : NSObject <NSSecureCoding>

@property (assign, nonatomic) NSInteger objectId;
@property (strong, nonatomic, nullable) NSString *date;
@property (strong, nonatomic, nullable) NSString *amount;
@property (strong, nonatomic, nullable) NSString *type;

@end
