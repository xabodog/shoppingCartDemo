//
//  CartItem.m
//  简单购物车demo
//
//  Created by qingyun on 16/8/19.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "CartItem.h"
#import "Product.h"

@implementation CartItem

- (id)initWithProduct:(Product *)product
{
    return [self initWithProduct:product andQuantity:1];
}

- (id)initWithProduct:(Product *)product andQuantity:(int)quantity
{
    self = [super init];
    
    if(self)
    {
        self.product = product;
        self.quantity = quantity;
    }
    
    return self;
}

@end
