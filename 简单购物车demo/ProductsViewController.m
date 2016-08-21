//
//  ProductsViewController.m
//  简单购物车demo
//
//  Created by qingyun on 16/8/19.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductCell.h"
#import "Product.h"
#import <MJExtension.h>
#import "Cart.h"
#import "CartViewController.h"

@interface ProductsViewController ()

@property (nonatomic, strong) NSMutableArray *array;
//@property (nonatomic, assign) NSInteger clickNum;
@property (nonatomic, strong) NSMutableArray *cartList;
@end
@implementation ProductsViewController

- (NSMutableArray *)array{
    if (!_array) {
        _array = [Product listProducts];
        
        [self.tableView reloadData];
    }
    return _array;
}

- (NSMutableArray *)cartList{
    if (_cartList == nil) {
        _cartList = [NSMutableArray array];
    }
    return _cartList;
}
static NSString *CellID = @"productCell";

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ProductCell" bundle:nil] forCellReuseIdentifier:CellID];
    self.tableView.rowHeight = 160;

}
- (void)addToCart:(UIButton *)button{
    Product *product = [self.array objectAtIndex:button.tag];
    BOOL success = [Cart addProduct:product];
    if (success) {
        int total = [Cart totalProducts];
        UITabBarItem *cartTab = [self.tabBarController.tabBar.items objectAtIndex:1];
        
        if(total == 0)
            cartTab.badgeValue = nil;
        else
            cartTab.badgeValue = [NSString stringWithFormat:@"%d", total];
        UINavigationController *cartNavController = (UINavigationController *)[self.tabBarController.viewControllers objectAtIndex:1];
        CartViewController *cartViewController = (CartViewController *)[cartNavController.viewControllers objectAtIndex:0];
        [cartViewController loadItems];

        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add Product" message:@"Product added to cart" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    

}

#pragma mark - TableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    ProductCell * cell = (ProductCell *)[tableView dequeueReusableCellWithIdentifier:CellID];
    
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    cell.product = self.array[indexPath.row];
    [cell.addToCartButton addTarget:self action:@selector(addToCart:) forControlEvents:UIControlEventTouchUpInside];
    cell.addToCartButton.tag = [indexPath row];
    return cell;
}



@end
