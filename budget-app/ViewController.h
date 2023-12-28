//
//  ViewController.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 25.12.2023.
//

#import <UIKit/UIKit.h>
#import "TransactionDataModel.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray<TransactionDataModel *> *data;

@end

