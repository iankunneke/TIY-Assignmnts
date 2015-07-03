//
//  FormValidatorViewController.m
//  FormValidator
//
//  Created by ian kunneke on 7/2/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FormValidatorViewController.h"

@interface FormValidatorViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;




@end

@implementation FormValidatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    


}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL returnValue = NO;
    
    if (textField == self.nameTextField)
    {
        if (![self.nameTextField.text isEqualToString:@""])
        {
            NSArray *theCoolNames = [self.nameTextField.text componentsSeparatedByString:@" "];
            if ([theCoolNames count] == 2)
            {
            returnValue = YES;
            [self.addressTextField becomeFirstResponder];
            }
        }
    }
    
    
    
    
    else if (textField == self.addressTextField)
    {
        if (![self.addressTextField.text isEqualToString:@""])
        {
            NSArray *addressPlace = [self.addressTextField.text componentsSeparatedByString:@" "];
            if ([addressPlace count] >= 3)
            {
                returnValue = YES;
                [self.cityTextField becomeFirstResponder];
            }
            
        }
    }
    
    
    
    
    else if (textField == self.cityTextField)
    {
        if (![self.cityTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.stateTextField becomeFirstResponder];
        }
    }
    
    
    
    else if (textField == self.stateTextField)
    {
        if ([self.stateTextField.text length] == 2)
        {
            returnValue = YES;
            [self.zipTextField becomeFirstResponder];
        }
    }


    else if (textField == self.zipTextField)
    {
        if ([self.zipTextField.text length] == 5)
        {
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            if ([self.zipTextField.text rangeOfCharacterFromSet:set].location != NSNotFound)
            {
                returnValue = YES;
                [self.phoneTextField becomeFirstResponder];
            }
        }
        
    }
    
    
    else if (textField == self.phoneTextField)
    {
        if ([self.phoneTextField.text length] == 10)
        {
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            if ([self.phoneTextField.text rangeOfCharacterFromSet:set].location != NSNotFound)
            {
                returnValue = YES;
                [self.phoneTextField resignFirstResponder];
            }
        }
        
    }
    return returnValue;
}
    @end