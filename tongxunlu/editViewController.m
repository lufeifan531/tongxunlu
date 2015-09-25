//
//  editViewController.m
//  tongxunlu
//
//  Created by 陆非凡 on 15/8/24.
//  Copyright (c) 2015年 陆非凡. All rights reserved.
//

#import "editViewController.h"

@implementation editViewController
- (IBAction)editaction:(UIBarButtonItem *)sender {
    if(self.namefield.enabled){
        self.namefield.enabled = NO;
        self.phonefield.enabled = NO;
        [self.view endEditing:YES];
        self.savebutton.enabled = YES;
        self.editbutton.title = @"编辑";
        self.namefield.text = self.contractModel.name;
        self.phonefield.text = self.contractModel.phoneNumber;
    }
    else{
        self.namefield.enabled = YES;
        self.phonefield.enabled = YES;
        [self.view endEditing:NO];
        self.savebutton.enabled = NO;
        self.editbutton.title = @"取消";
    }
}
- (IBAction)saveaction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if ([self.delegate respondsToSelector:@selector(editViewController:didSaveContract:)]){
        self.contractModel.name = self.namefield.text;
        self.contractModel.phoneNumber = self.phonefield.text;
        [self.delegate editViewController:self didSaveContract:self.contractModel];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.namefield.text = self.contractModel.name;
    self.phonefield.text = self.contractModel.phoneNumber;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.namefield];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phonefield];
}

-(void)textChange
{
    if(self.namefield.text.length && self.phonefield.text.length )
        self.savebutton.enabled = YES;
    else
        self.savebutton.enabled = NO;
}

@end
