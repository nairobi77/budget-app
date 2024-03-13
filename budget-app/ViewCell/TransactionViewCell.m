//
//  YourCollectionViewCell.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 27.12.2023.
//

#import "TransactionViewCell.h"
#define MAS_SHORTHAND
#import "Masonry.h"

@interface TransactionViewCell ()

@property (strong, nonatomic) UILabel *date;
@property (strong, nonatomic) UILabel *amount;
@property (strong, nonatomic) UILabel *type;

@end

@implementation TransactionViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setupLayout];
    return self;
}

- (void)update:(TransactionDataModel *)dataModel {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    self.date.text = [formatter stringFromDate:dataModel.date];
    self.amount.text = [dataModel.amount stringValue];
    self.type.text = dataModel.type;
}

-(void)setupLayout {
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    self.date = [UILabel new];
    self.amount = [UILabel new];
    self.type = [UILabel new];
    UIStackView *container = [UIStackView new];
    [container setAxis:UILayoutConstraintAxisHorizontal];
    [container setAlignment:UIStackViewAlignmentLeading];
    [container setSpacing:16.0];
    [self.date setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [container addArrangedSubview:self.date];
    [container addArrangedSubview:self.amount];
    [container addArrangedSubview:self.type];
    [self.contentView addSubview:container];
    [container makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(padding);
    }];
}

@end
