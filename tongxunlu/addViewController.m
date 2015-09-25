//
//  addViewController.m
//  tongxunlu
//
//  Created by 陆非凡 on 15/8/24.
//  Copyright (c) 2015年 陆非凡. All rights reserved.
//

#import "addViewController.h"
#import "jkcontractModel.h"
@implementation addViewController
- (IBAction)fanhuibutton:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)addaction:(UIButton *)sender {
        if ([self.delegate respondsToSelector:@selector(addContract:didAddContract:)]) {
        jkcontractModel *contractModel = [[jkcontractModel alloc]init];
        contractModel.name = self.namefield.text;
        contractModel.phoneNumber = self.phonefield.text;
        [self.delegate addContract:self didAddContract:contractModel];
    }
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addbutton.enabled = NO;
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.namefield];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phonefield];
}

-(void)textChange
{
    if(self.namefield.text.length && self.phonefield.text.length )
        self.addbutton.enabled = YES;
    else
        self.addbutton.enabled = NO;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.namefield becomeFirstResponder];
    
}
- (IBAction)namefieldEnd:(UITextField *)sender {
    [self.phonefield becomeFirstResponder];
}
@end
