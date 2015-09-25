//
//  jkcontractModel.m
//  tongxunlu
//
//  Created by 陆非凡 on 15/8/24.
//  Copyright (c) 2015年 陆非凡. All rights reserved.
//

#import "jkcontractModel.h"

@implementation jkcontractModel


-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.phoneNumber forKey:@"phone"];
}

-(id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init]){
        self.name = [decoder decodeObjectForKey:@"name"];
        self.phoneNumber = [decoder decodeObjectForKey:@"phone"];
    }
    return self;
}
@end

