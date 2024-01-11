//
//  TransactionViewCell.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import <UIKit/UIKit.h>
#import "TransactionDataModel.h"

@interface TransactionViewCell : UITableViewCell
-(void)update:(TransactionDataModel *)dataModel;
@end
