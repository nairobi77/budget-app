//
//  ViewController.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 25.12.2023.
//

#import "ViewController.h"
#import "TransactionDataModel.h"
#import "TransactionViewCell.h"
#import "Repository.h"
#import "AddItemViewController.h"
#define MAS_SHORTHAND
#import "Masonry.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray<TransactionDataModel *> *dataArray;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIButton *addButton;
@property (strong, nonatomic) Repository *repository;


@end

@implementation ViewController
static NSString *cellIdentifier = @"CellIdentifier";

- (void)addButtonPressed:(UIButton *)sender  {
    
    AddItemViewController *additemVC = [AddItemViewController new];
    additemVC.repository = self.repository;
    additemVC.vc = self;
    [self presentViewController:additemVC
                       animated:YES
                     completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.repository = [Repository new];
    self.tableView = [UITableView new];
    self.addButton = [UIButton new];
    self.dataArray = [self.repository getData];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:TransactionViewCell.self forCellReuseIdentifier: cellIdentifier];
    [self setupLayout];
    [self setupAppearance];
    [self setupAction];
}

- (void)setupLayout {
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 96, 0);
    [self.view addSubview:self.tableView];
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(padding);
    }];
    [self.view addSubview:self.addButton];
    [self.addButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(128);
        make.height.mas_equalTo(32);
        make.top.equalTo(self.tableView.bottom).with.inset(24);
    }];
}

- (void)setupAppearance {
    [self.view setBackgroundColor:UIColor.darkGrayColor];
    self.addButton.layer.cornerRadius = 7.0f;
    [self.addButton setBackgroundColor:UIColor.lightGrayColor];
    [self.addButton setTitle:@"Add item" forState:UIControlStateNormal];
}

- (void)setupAction {
    [self.addButton addTarget:self action:@selector(addButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TransactionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[TransactionViewCell new] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    TransactionDataModel *dataItem = self.dataArray[indexPath.row];
    
    [cell update: dataItem];


    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Handle row selection if needed
}

#pragma mark - ViewInput

-(void)updateWithModel:(TransactionDataModel *)dataModel {
    [self.dataArray addObject:dataModel];
    [self.tableView reloadData];
}

@end
