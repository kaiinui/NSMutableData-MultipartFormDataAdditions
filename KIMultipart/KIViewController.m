//
//  KIViewController.m
//  KIMultipart
//
//  Created by kaiinui on 2014/09/13.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIViewController.h"

#import "NSMutableData+MultipartFormData.h"

@interface KIViewController ()

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableData *data = [[NSMutableData alloc] init];
    [data mp_setString:@"bar" forKey:@"string"];
    [data mp_setInteger:3 forKey:@"number"];
    [data mp_setDouble:398.f forKey:@"double"];
    
    UIImage *image = [UIImage imageNamed:@"ac.jpg"];
    [data mp_setJPEGImage:image withQuality:1.0f forKey:@"alice"];
    
    NSLog(@"%@", data.mp_stringRepresentation);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
