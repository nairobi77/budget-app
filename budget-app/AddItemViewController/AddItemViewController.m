//
//  AddItemViewController.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 07.01.2024.
//

#import "AddItemViewController.h"
#import "Repository.h"
#import "TransactionDataModel.h"
#define MAS_SHORTHAND
#import "Masonry.h"

NSNumber *const itemHeihgt = @40;
NSString *const amountInputPlaceholder = @"Amount";
NSString *const noteInputPlaceholder = @"Note";
NSString *const savePuttonTitle = @"Save";

@interface AddItemViewController ()

@property (strong, nonatomic) UITextField *amountInput;
@property (strong, nonatomic) UITextField *noteInput;
@property (strong, nonatomic) UIButton *saveButton;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayout];
    [self setupAppearance];
    [self setupAction];
}

- (void) setupLayout {
    UIView *superview = self.view;
    [superview setBackgroundColor:[UIColor whiteColor]];
    UIView *container = [UIView new];
    
    [superview addSubview:container];
    [container makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(superview).with.inset(100);
    }];
    
    UIStackView *stackContainer = [UIStackView new];
    
    [stackContainer setAxis:UILayoutConstraintAxisVertical];
    [stackContainer setAlignment:UIStackViewAlignmentFill];
    [stackContainer setSpacing:20];
    
    [container addSubview:stackContainer];
    [stackContainer makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(container);
    }];
    
    self.amountInput = [UITextField new];
    self.noteInput = [UITextField new];
    self.saveButton = [UIButton new];
    
    
    [stackContainer addArrangedSubview:self.amountInput];
    [stackContainer addArrangedSubview:self.noteInput];
    [stackContainer addArrangedSubview:self.saveButton];
    
    [self.amountInput makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(itemHeihgt);
    }];
    
    [self.noteInput makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(itemHeihgt);
    }];
    
    [self.saveButton makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(itemHeihgt);
    }];
}
- (void)setupAppearance {
    self.amountInput = [self prepareInput:_amountInput];
    [self.amountInput setKeyboardType:UIKeyboardTypeNumberPad];
    [self.amountInput setPlaceholder:amountInputPlaceholder];
    self.noteInput = [self prepareInput:_noteInput];
    [self.noteInput setPlaceholder:noteInputPlaceholder];
    self.saveButton.layer.cornerRadius = 7.0f;
    [self.saveButton setBackgroundColor:[UIColor grayColor]];
    [self.saveButton setTitle:savePuttonTitle forState:UIControlStateNormal];
}

- (void)setupAction {
    [self.saveButton addTarget:self action:@selector(saveItem:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)saveItem:(UIButton *) sender {
    NSDecimalNumber *amount = [NSDecimalNumber decimalNumberWithString:self.amountInput.text];
    NSString *noteText = self.noteInput.text;
    
    if (amount > 0 && noteText.length > 0) {
        TransactionDataModel *dataModel = [TransactionDataModel new];
        dataModel.amount = amount;
        dataModel.type = noteText;
        dataModel.date = [NSDate now];
        [self.repository saveData:dataModel];
        [self.vc updateWithModel:dataModel];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (UITextField *)prepareInput:(UITextField *) input {
    [input setBorderStyle:UITextBorderStyleRoundedRect];
    input.layer.borderColor = [UIColor colorWithRed:151.0/255.0f green:193.0/255.0f blue:252.0/255.0f alpha:1.0f].CGColor;
    input.layer.borderWidth = 3.0f;
    input.layer.cornerRadius = 7.0f;
    return input;
}

@end

