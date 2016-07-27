//
//  ViewController.m
//  UIElements
//
//  Created by LLDM on 26/07/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "ViewController.h"
#import "TempViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UILabel *aLabel;
UIBarButtonItem *myNavBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationBarButton];
//  [self addTextField];
    [self addToolbar];
    [self addLabel];
    [self addTextFieldWithDifferentKeyboard];
    [self addDifferentTypesOfButton];
//  [self performSelector:@selector(hideStatusbar) withObject:nil afterDelay:3.0];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)pushNewView:(id)sender{
    TempViewController *tempVC =[[TempViewController alloc] initWithNibName:@"TempViewController" bundle:nil];
    [self.navigationController pushViewController:tempVC animated:YES];
}

-(IBAction)myButtonClicked:(id)sender{ // toggle hidden state for navButton
    [navButton setHidden:!navButton.hidden];
    if(navButton.hidden) {
        [aLabel setHidden:NO];
        [myNavBtn setTitle:@"Show Navigation Button"];
    } else {
        [aLabel setHidden:YES];
        [myNavBtn setTitle:@"Hide Navigation Button"];
    }
}
-(void)addNavigationBarButton{
    myNavBtn = [[UIBarButtonItem alloc] initWithTitle: @"Show Navigation Button" style:UIBarButtonItemStyleBordered target:self action:@selector(myButtonClicked:)];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationItem setRightBarButtonItem:myNavBtn];
    // create a navigation push button that is initially hidden
    navButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [navButton setFrame:CGRectMake(0, 95, 375, 50)];
    [navButton setTitle:@"\"Click me!!!\"" forState:UIControlStateNormal];
    [navButton addTarget:self action:@selector(pushNewView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navButton];
    [navButton setHidden:YES];
}

//-(void)addTextField {
//    // This allocates a label
//    UILabel *prefixLabel = [[UILabel alloc]initWithFrame:CGRectZero];
//    //This sets the label text
//    prefixLabel.text =@"## ";
//    // This sets the font for the label
//    [prefixLabel setFont:[UIFont boldSystemFontOfSize:14]];
//    // This fits the frame to size of the text
//    [prefixLabel sizeToFit];
//    // This allocates the textfield and sets its frame
//    UITextField *textField = [[UITextField alloc] initWithFrame: CGRectMake(20, 20, 150, 30)];
//    // This sets the border style of the text field
//    textField.borderStyle = UITextBorderStyleRoundedRect; textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    [textField setFont:[UIFont boldSystemFontOfSize:12]];
//    //Placeholder text is displayed when no text is typed
//    textField.placeholder = @"Simple Text field";
//    //Prefix label is set as left view and the text starts after that
//    textField.leftView = prefixLabel;
//    //It set when the left prefixLabel to be displayed
//    textField.leftViewMode = UITextFieldViewModeAlways;
//    // Adds the textField to the view.
//    [self.view addSubview:textField];
//    // sets the delegate to the current class
//    textField.delegate = self;
//}


-(void)addToolbar
{
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *customItem1 = [[UIBarButtonItem alloc] initWithTitle:@"Tool1" style:UIBarButtonItemStyleBordered target:self action:@selector(toolBarItem1:)];
    UIBarButtonItem *customItem2 = [[UIBarButtonItem alloc] initWithTitle:@"Tool2" style:UIBarButtonItemStyleDone target:self action:@selector(toolBarItem2:)];
    NSArray *toolbarItems = [NSArray arrayWithObjects: customItem1,spaceItem, customItem2, nil];
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame: CGRectMake(0, 65, 375, 30)];
    [toolbar setBarStyle:UIBarStyleBlackOpaque];
    [self.view addSubview:toolbar];
    [toolbar setItems:toolbarItems];
}

-(void)addLabel{
    aLabel = [[UILabel alloc]initWithFrame: CGRectMake(0, 95, 375, 50)];
    aLabel.numberOfLines = 0;
    aLabel.textColor = [UIColor blueColor];
    aLabel.backgroundColor = [UIColor clearColor];
    aLabel.textAlignment = NSTextAlignmentCenter;
    aLabel.text = @"\"This is a label...\"\n-Gerald Kim Ico";
    [self.view addSubview:aLabel];
}

-(void) addTextFieldWithDifferentKeyboard {
    UITextField *textField1= [[UITextField alloc]initWithFrame: CGRectMake(20, 150, 335, 30)];
    textField1.delegate = self;
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.placeholder = @"Default Keyboard";
    [self.view addSubview:textField1];
    UITextField *textField2 = [[UITextField alloc]initWithFrame: CGRectMake(20, 180, 335, 30)];
    textField2.delegate = self;
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.keyboardType = UIKeyboardTypeASCIICapable;
    textField2.placeholder = @"ASCII keyboard";
    [self.view addSubview:textField2];
    UITextField *textField3 = [[UITextField alloc]initWithFrame: CGRectMake(20, 210, 335, 30)];
    textField3.delegate = self;
    textField3.borderStyle = UITextBorderStyleRoundedRect;
    textField3.keyboardType = UIKeyboardTypePhonePad;
    textField3.placeholder = @"Phone pad keyboard";
    [self.view addSubview:textField3];
    UITextField *textField4 = [[UITextField alloc]initWithFrame: CGRectMake(20, 240, 335, 30)];
    textField4.delegate = self;
    textField4.borderStyle = UITextBorderStyleRoundedRect;
    textField4.keyboardType = UIKeyboardTypeDecimalPad;
    textField4.placeholder = @"Decimal pad keyboard";
    [self.view addSubview:textField4];
    UITextField *textField5= [[UITextField alloc]initWithFrame: CGRectMake(20, 270, 335, 30)];
    textField5.delegate = self;
    textField5.borderStyle = UITextBorderStyleRoundedRect;
    textField5.keyboardType = UIKeyboardTypeEmailAddress;
    textField5.placeholder = @"Email keyboard";
    [self.view addSubview:textField5];
    UITextField *textField6= [[UITextField alloc]initWithFrame: CGRectMake(20, 300, 335, 30)];
    textField6.delegate = self;
    textField6.borderStyle = UITextBorderStyleRoundedRect;
    textField6.keyboardType = UIKeyboardTypeURL;
    textField6.placeholder = @"URL keyboard";
    [self.view addSubview:textField6];
}

-(void)addDifferentTypesOfButton {
    // A rounded Rect button created by using class method
    UIButton *roundRectButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [roundRectButton setFrame:CGRectMake(60, 350, 255, 40)];
    // sets title for the button
    [roundRectButton setTitle:@"Rounded Rect Button" forState: UIControlStateNormal];
    [self.view addSubview:roundRectButton];
    UIButton *customButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [customButton setBackgroundColor: [UIColor lightGrayColor]];
    [customButton setTitleColor:[UIColor blackColor] forState: UIControlStateHighlighted];
    //sets background image for normal state
    [customButton setBackgroundImage:[UIImage imageNamed: @"Button_Default.png"] forState:UIControlStateNormal];
    //sets background image for highlighted state
    [customButton setBackgroundImage:[UIImage imageNamed: @"Button_Highlighted.png"] forState:UIControlStateHighlighted];
    [customButton setFrame:CGRectMake(60, 400, 255, 40)];
    [customButton setTitle:@"Custom Button" forState:UIControlStateNormal];
    [self.view addSubview:customButton];
    UIButton *detailDisclosureButton = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];
    [detailDisclosureButton setFrame:CGRectMake(60, 450, 255, 40)];
    [detailDisclosureButton setTitle:@"Detail disclosure" forState: UIControlStateNormal];
    [self.view addSubview:detailDisclosureButton];
    UIButton *contactButton = [UIButton buttonWithType: UIButtonTypeContactAdd];
    [contactButton setFrame:CGRectMake(60, 500, 255, 40)];
    [self.view addSubview:contactButton];
    UIButton *infoDarkButton = [UIButton buttonWithType: UIButtonTypeInfoDark];
    [infoDarkButton setFrame:CGRectMake(60, 550, 255, 40)];
    [self.view addSubview:infoDarkButton];
    UIButton *infoLightButton = [UIButton buttonWithType: UIButtonTypeInfoLight];
    [infoLightButton setFrame:CGRectMake(60, 600, 255, 40)];
    [self.view addSubview:infoLightButton];
}

-(void)hideStatusbar{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    [UIView beginAnimations:@"Statusbar hide" context:nil];
    [UIView setAnimationDuration:0.5];
    [self.view setFrame:CGRectMake(0, 0, 320, 480)];
    [UIView commitAnimations];
}

// pragma mark is used for easy access of code in Xcode
#pragma mark - TextField Delegates

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"Text field did begin editing");
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Text field ended editing");
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)toolBarItem1:(id)sender{
    [aLabel setHidden:NO];
    [navButton setHidden:YES];
    [myNavBtn setTitle:@"Show Navigation Button"];
    [aLabel setText:@"Tool 1 Selected"];
}
-(IBAction)toolBarItem2:(id)sender{
    [aLabel setHidden:NO];
    [navButton setHidden:YES];
    [myNavBtn setTitle:@"Show Navigation Button"];
    [aLabel setText:@"Tool 2 Selected"];
}

- (void)viewDidUnload {
    aLabel = nil;
    [super viewDidUnload];
}

@end
