//
//  CartViewController.m
//  简单购物车demo
//
//  Created by qingyun on 16/8/19.
//  Copyright © 2016年 zzc. All rights reserved.
//

#import "CartViewController.h"
#import "CheckoutHeaderview.h"
#import "ProductCartCell.h"
#import "Cart.h"
#import "CartItem.h"
@interface CartViewController ()

@property (strong, nonatomic) NSMutableArray *items;

@end
@implementation CartViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ProductCartCell" bundle:nil] forCellReuseIdentifier:@"ProductCartCell"];
    self.tableView.rowHeight = 160;
    [self loadItems];
}
- (void)loadItems
{
    self.items = [Cart contents];
    [self.tableView reloadData];
}

- (void)deleteProduct:(UIButton *)button
{
    CartItem *item = [self.items objectAtIndex:button.tag];
    BOOL success = [Cart removeProduct:item.product];
    
    if(success)
    {
        [self.tableView beginUpdates];
        [self.items removeObjectAtIndex:button.tag];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:button.tag inSection:0];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        
        [self.tableView reloadData];
        
        int total = [Cart totalProducts];
        UITabBarItem *cartTab = [self.tabBarController.tabBar.items objectAtIndex:1];
        
        if(total == 0)
            cartTab.badgeValue = nil;
        else
            cartTab.badgeValue = [NSString stringWithFormat:@"%d", total];
    }
}
- (void)checkout:(UIButton *)button
{
    NSLog(@"请前往付款");
}
#pragma mark - TableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ProductCartCell";
    
    ProductCartCell *cell = (ProductCartCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    CartItem *item = [self.items objectAtIndex:[indexPath row]];
    
    // Configure the cell...
    cell.productImage.image = [UIImage imageNamed:item.product.image];
    cell.productImage.contentMode = UIViewContentModeScaleAspectFit;
    cell.productTitle.text = item.product.name;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:2];
    [formatter setRoundingMode: NSNumberFormatterRoundDown];
    cell.productPrice.text = [NSString stringWithFormat:@"$%@", [formatter stringFromNumber:[NSNumber numberWithDouble:[item.product.price doubleValue]]]];
    
    cell.quantity.text = [NSString stringWithFormat:@"%d", item.quantity];
    
    [cell.deleteButton addTarget:self action:@selector(deleteProduct:) forControlEvents:UIControlEventTouchUpInside];
    cell.deleteButton.tag = [indexPath row];
    
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CheckoutHeaderView" owner:self options:nil];
    
    CheckoutHeaderview *checkoutHeaderview = [nib objectAtIndex:0];
    
    checkoutHeaderview.subtotal.text = [NSString stringWithFormat:@"Subtotal (%d):", [Cart totalProducts]];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:2];
    [formatter setRoundingMode: NSNumberFormatterRoundDown];
    checkoutHeaderview.total.text = [NSString stringWithFormat:@"$%@", [formatter stringFromNumber:[NSNumber numberWithDouble:[Cart totalAmount]]]];
    
    [checkoutHeaderview.checkoutButton addTarget:self action:@selector(checkout:) forControlEvents:UIControlEventTouchUpInside];
    
    return checkoutHeaderview;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70.0f;
}

@end
