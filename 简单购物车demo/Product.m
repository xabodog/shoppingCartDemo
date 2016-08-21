//
//  Product.m
//  简单购物车demo
//
//  Created by qingyun on 16/8/19.
//  Copyright © 2016年 zzc. All rights reserved.
//
#import "Product.h"
#import "FMDatabase.h"
#import "Db.h"

@implementation Product

- (instancetype)initWithDictionary:(NSDictionary *)Dict{
    if (self = [super init]) {
        _name = Dict[@"name"];
         _id = [Dict[@"id"] intValue];
        _image = Dict [@"image"];
        _price = Dict[@"price"];
    }
    return self;
}

+ (instancetype)ProductWithDictionary:(NSDictionary *)Dict{
    return [[self alloc]initWithDictionary:Dict];
}
+ (NSMutableArray *)listProducts
{
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[Db getDatabasePath]];
    
    [db open];
    
    FMResultSet *results = [db executeQuery:@"SELECT * FROM products"];
    
    while([results next])
    {
        Product *product = [[Product alloc] init];
        
        product.id = [results intForColumn:@"id"];
        product.name = [results stringForColumn:@"name"];
        product.image = [results stringForColumn:@"image"];
        product.price = [results stringForColumn:@"price"];
        
        [products addObject:product];
    }
    
    [db close];
    
    return products;
}


@end
