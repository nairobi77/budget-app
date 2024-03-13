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

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray<TransactionDataModel *> *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Repository *repository;


@end

@implementation ViewController
static NSString *cellIdentifier = @"CellIdentifier";

- (IBAction)addButtonPressed:(id)sender {
    
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
    self.dataArray = [self.repository getData];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:TransactionViewCell.self forCellReuseIdentifier: cellIdentifier];
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
//    [cell setupLayout];

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
