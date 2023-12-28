//
//  TransactionDataModel.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import <Foundation/Foundation.h>

@interface TransactionDataModel : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *type;

@end
