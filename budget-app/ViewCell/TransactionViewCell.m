//
//  YourCollectionViewCell.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import "TransactionViewCell.h"

@interface TransactionViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *amount;
@property (strong, nonatomic) IBOutlet UILabel *type;


@end

@implementation TransactionViewCell

- (void)update:(TransactionDataModel *)dataModel {
    self.date.text = dataModel.date;
    self.amount.text = dataModel.amount;
    self.type.text = dataModel.type;
}

@end
