//
//  AddItemViewController.h
//  budget-app
//
//  Created by Kurakin Aleksandr on 07.01.2024.
//

#import <UIKit/UIKit.h>
#import "Repository.h"
#import "ViewController.h"

@interface AddItemViewController : UIViewController

@property (weak, nonatomic) Repository *repository;
@property (strong, nonatomic) ViewController *vc;

@end
