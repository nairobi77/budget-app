//
//  AddItemViewController.m
//  budget-app
//
//  Created by Kurakin Aleksandr on 07.01.2024.
//

#import "AddItemViewController.h"
#import "Repository.h"
#import "TransactionDataModel.h"

@interface AddItemViewController ()

@property (strong, nonatomic) IBOutlet UITextField *amountInputField;
@property (strong, nonatomic) IBOutlet UITextField *noteField;

@end

@implementation AddItemViewController

- (IBAction)saveItemAction:(id)sender {
    NSString *amountText = self.amountInputField.text;
    NSString *noteText = self.noteField.text;
    
    if (amountText.length > 0 && noteText.length > 3) {
        TransactionDataModel *dataModel = [[TransactionDataModel alloc] init];
        dataModel.amount = amountText;
        dataModel.type = noteText;
        [self.repository saveData:dataModel];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end

