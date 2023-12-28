//
//  ViewController.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 25.12.2023.
//

#import "ViewController.h"
#import "TransactionDataModel.h"
#import "TransactionViewCell.h"


typedef struct {
    int id;
    NSString *date;
    NSString *amount;
    NSString *type;
} DataModel;

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController


- (IBAction)addButton:(id)sender {
    NSLog(@"Add button pressed");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = self.dataModelCollection;
    [self.collectionView registerClass:[TransactionViewCell class] forCellWithReuseIdentifier:@"CellIdentifier"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView          cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TransactionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellIdentifier" forIndexPath:indexPath];

    // Configure the cell with data from YourDataModel
    TransactionDataModel *dataModel = self.data[indexPath.item];
    cell.date.text = dataModel.date;
    cell.amount.text = dataModel.amount;
    cell.type.text = dataModel.type;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(collectionView.bounds.size.width, 30);
}

#pragma mark - UICollectionViewDelegate

// Implement delegate methods if needed

-(NSArray<TransactionDataModel*>*)dataModelCollection {
    NSMutableArray<TransactionDataModel*> *collection = [[NSMutableArray alloc] init];
    TransactionDataModel *data = [[TransactionDataModel alloc] init];
    for(int i = 0; i < 100; i++) {
        
        data.id = @1;
        data.date = @"27.12.2023";
        data.amount = @"1400";
        data.type = @"shop";
        [collection addObject:data];
    };
   
    return collection;
}
@end
