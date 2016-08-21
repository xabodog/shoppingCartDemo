//
//  CartItem.h
//  简单购物车demo
//
//  Created by qingyun on 16/8/19.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product;

@interface CartItem : NSObject
@property (nonatomic, strong) Product *product;
@property (assign, nonatomic) int quantity;

- (id)initWithProduct:(Product *)product;
- (id)initWithProduct:(Product *)product andQuantity:(int)quantity;
@end
