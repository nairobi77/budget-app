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

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, ViewInput>

@property (nonatomic, strong) NSArray<TransactionDataModel *> *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Repository *repository;

@end

@implementation ViewController

- (IBAction)addButtonPressed:(id)sender {
    
    AddItemViewController *additemVC = [AddItemViewController new];
    additemVC.repository = self.repository;
    [self presentViewController:additemVC
                       animated:YES
                     completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.repository = [Repository new];
    self.repository.view = self;
    
    self.dataArray = [self.repository getData];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    TransactionViewCell *cell = (TransactionViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

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

- (void)update:(NSArray<TransactionDataModel *> *)dataArray {
    self.dataArray = dataArray;
    [self.tableView reloadData];
}

@end
