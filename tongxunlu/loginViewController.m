//
//  loginViewController.m
//  tongxunlu
//
//  Created by 陆非凡 on 15/8/24.
//  Copyright (c) 2015年 陆非凡. All rights reserved.
//

#import "loginViewController.h"
#import "MBProgressHUD.h"

#define UserNameKey @"name"
#define PwdKey @"pwd"
#define RmbPwdKey @"rmb_pwd"

@implementation loginViewController

- (IBAction)loginAction {
    if(![self.namefield.text  isEqual: @"lufeifan"]){
     [self showError:@"帐号不存在"];
    return;
    }
    if(![self.mimafield.text  isEqual: @"1324658"]){
        [self showError:@"密码错误"];
    return;
    }
    [self showmessage];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"view1ToView2" sender:nil];
    });
    //存储数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.namefield.text forKey:UserNameKey];
    [defaults setObject:self.mimafield.text forKey:PwdKey];
    [defaults setBool:self.jizhuswitch.isOn forKey:RmbPwdKey];
    //设置同步
    [defaults synchronize];
    
}

-(void)showError:(NSString *)n
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg"]] ;
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = [NSString stringWithFormat:@"%@",n];
    [HUD show:YES];
    [HUD hide:YES afterDelay:2];
}

-(void)showmessage
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.dimBackground = YES;
    HUD.labelText = @"努力加载中";
    // Regiser for HUD callbacks so we can remove it from the window at the right time
//    HUD.delegate = self;
    // Show the HUD while the provided method executes in a new thread
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}
-(void)myTask
{
    sleep(2);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.namefield];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.mimafield];
    //读取上次配置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    self.namefield.text = [defaults valueForKey:UserNameKey];
//    self.mimafield.text = [defaults valueForKey:PwdKey];
    self.jizhuswitch.on = [defaults boolForKey:RmbPwdKey];
    if(self.jizhuswitch.isOn){
        self.namefield.text = [defaults valueForKey:UserNameKey];
        self.mimafield.text = [defaults valueForKey:PwdKey];
        self.loginbutton.enabled = YES;
    }
        
    
}

-(void)textChange
{
    if(self.namefield.text.length && self.mimafield.text.length )
        self.loginbutton.enabled = YES;
    else
        self.loginbutton.enabled = NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *contractView = segue.destinationViewController;
    contractView.title = [NSString stringWithFormat:@"%@的联系人列表",self.namefield.text];
}
- (IBAction)namefield1:(UITextField *)sender {
//    [self resignFirstResponder];
    [self.mimafield becomeFirstResponder];
}
- (IBAction)mimaend:(UITextField *)sender {
    [self.loginbutton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
