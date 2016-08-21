//
//  Product.h
//  简单购物车demo
//
//  Created by qingyun on 16/8/19.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic, assign) int id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, assign) NSString *price;

- (instancetype)initWithDictionary:(NSDictionary *)Dict;
+ (instancetype)ProductWithDictionary:(NSDictionary *)Dict;
+ (NSMutableArray *)listProducts;

@end
