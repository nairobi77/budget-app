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


typedef struct {
    int id;
    NSString *date;
    NSString *amount;
    NSString *type;
} DataModel;

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Repository *repository;
@end

@implementation ViewController

- (IBAction)addButton:(id)sender {
    NSLog(@"Add button pressed");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.repository = [[Repository alloc] init];
    self.dataArray = [self.repository getData];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }

    // Get the data model object for the current row
    TransactionDataModel *dataItem = self.dataArray[indexPath.row];

    // Populate the cell with data
    cell.textLabel.text = dataItem.date;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ | %@", dataItem.amount, dataItem.type];

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Handle row selection if needed
}

#pragma mark - UITableViewDelegate

@end
