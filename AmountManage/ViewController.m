//
//  ViewController.m
//  AmountManage
//
//  Created by Gaurav Malviya on 08/02/18.
//  Copyright © 2018 Gaurav. All rights reserved.
//

#import "ViewController.h"
#import "AmountFormatter.h"

@interface ViewController () <UITextFieldDelegate>

{
    AmountFormatter *amountFormatter;
}

@property (weak, nonatomic) IBOutlet UITextField *tfAmount;
@property (strong, nonatomic) NSMutableString *originalString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _originalString = [NSMutableString new];
    
    amountFormatter = [AmountFormatter new];
    
    self.tfAmount.text = @"0.00";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    textField.text = [amountFormatter formatAmountInputOnCharacter:string oldString:textField.text];
    return false;
}

@end
