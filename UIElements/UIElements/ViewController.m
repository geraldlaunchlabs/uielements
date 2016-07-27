//
//  ViewController.m
//  UIElements
//
//  Created by LLDM on 26/07/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //The custom method to create our textfield is called
    [self addTextField];
    
    //The custom method to create textfield with different keyboard input
    [self addTextFieldWithDifferentKeyboard];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addTextField {
    // This allocates a label
    UILabel *prefixLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    //This sets the label text
    prefixLabel.text =@"## ";
    // This sets the font for the label
    [prefixLabel setFont:[UIFont boldSystemFontOfSize:14]];
    // This fits the frame to size of the text
    [prefixLabel sizeToFit];
    // This allocates the textfield and sets its frame
    UITextField *textField = [[UITextField alloc] initWithFrame: CGRectMake(20, 20, 150, 30)];
    // This sets the border style of the text field
    textField.borderStyle = UITextBorderStyleRoundedRect; textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [textField setFont:[UIFont boldSystemFontOfSize:12]];
    //Placeholder text is displayed when no text is typed
    textField.placeholder = @"Simple Text field";
    //Prefix label is set as left view and the text starts after that
    textField.leftView = prefixLabel;
    //It set when the left prefixLabel to be displayed
    textField.leftViewMode = UITextFieldViewModeAlways;
    // Adds the textField to the view.
    [self.view addSubview:textField];
    // sets the delegate to the current class
    textField.delegate = self;
}

-(void) addTextFieldWithDifferentKeyboard {
    UITextField *textField1= [[UITextField alloc]initWithFrame: CGRectMake(20, 50, 280, 30)];
    textField1.delegate = self;
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.placeholder = @"Default Keyboard";
    [self.view addSubview:textField1];
    UITextField *textField2 = [[UITextField alloc]initWithFrame: CGRectMake(20, 100, 280, 30)];
    textField2.delegate = self;
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.keyboardType = UIKeyboardTypeASCIICapable;
    textField2.placeholder = @"ASCII keyboard";
    [self.view addSubview:textField2];
    UITextField *textField3 = [[UITextField alloc]initWithFrame: CGRectMake(20, 150, 280, 30)];
    textField3.delegate = self;
    textField3.borderStyle = UITextBorderStyleRoundedRect;
    textField3.keyboardType = UIKeyboardTypePhonePad;
    textField3.placeholder = @"Phone pad keyboard";
    [self.view addSubview:textField3];
    UITextField *textField4 = [[UITextField alloc]initWithFrame: CGRectMake(20, 200, 280, 30)];
    textField4.delegate = self;
    textField4.borderStyle = UITextBorderStyleRoundedRect;
    textField4.keyboardType = UIKeyboardTypeDecimalPad;
    textField4.placeholder = @"Decimal pad keyboard";
    [self.view addSubview:textField4];
    UITextField *textField5= [[UITextField alloc]initWithFrame: CGRectMake(20, 250, 280, 30)];
    textField5.delegate = self;
    textField5.borderStyle = UITextBorderStyleRoundedRect;
    textField5.keyboardType = UIKeyboardTypeEmailAddress;
    textField5.placeholder = @"Email keyboard";
    [self.view addSubview:textField5];
    UITextField *textField6= [[UITextField alloc]initWithFrame: CGRectMake(20, 300, 280, 30)];
    textField6.delegate = self;
    textField6.borderStyle = UITextBorderStyleRoundedRect;
    textField6.keyboardType = UIKeyboardTypeURL;
    textField6.placeholder = @"URL keyboard";
    [self.view addSubview:textField6];
}

// pragma mark is used for easy access of code in Xcode
#pragma mark - TextField Delegates

// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"Text field did begin editing");
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Text field ended editing");
}

// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidUnload {
    //label = nil;
    [super viewDidUnload];
}

@end
