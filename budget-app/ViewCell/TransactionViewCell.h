//
//  TransactionViewCell.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import <UIKit/UIKit.h>

@interface TransactionViewCell : UITableViewCell

@property (nonatomic, strong) UIStackView *container;
@property (nonatomic, strong) UILabel *date;
@property (nonatomic, strong) UILabel *amount;
@property (nonatomic, strong) UILabel *type;

@end
