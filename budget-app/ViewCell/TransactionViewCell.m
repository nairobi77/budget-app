//
//  YourCollectionViewCell.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import "TransactionViewCell.h"

@implementation TransactionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialize and configure your labels here
        self.container = [[UIStackView alloc] initWithFrame:frame];
        [self.container setAxis:UILayoutConstraintAxisHorizontal];
        [self.container setSpacing:8];
        
        [self.contentView addSubview:self.container];
//        [self.container autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:7];
        
        CGFloat labelWidth = frame.size.width/3;
        CGFloat labelHeigth = frame.size.height/2;
        self.date = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeigth)];
        self.amount = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeigth)];
        self.type = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeigth)];
        
        [self.container addArrangedSubview:self.date];
        [self.container addArrangedSubview:self.amount];
        [self.container addArrangedSubview:self.type];

    }
    return self;
}

@end
