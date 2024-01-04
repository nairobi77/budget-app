//
//  TransactionDataModel.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import <Foundation/Foundation.h>

@interface TransactionDataModel : NSObject

@property (assign, nonatomic) NSInteger *objectId;
@property (strong, nonatomic) NSString *date;
@property (assign, nonatomic) NSString *amount;
@property (strong, nonatomic) NSString *type;

@end
