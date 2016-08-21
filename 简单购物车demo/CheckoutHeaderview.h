//
//  CheckoutHeaderview.h
//  ShoppingCartExample
//
//  Created by Jose Gustavo Rodriguez Baldera on 5/31/14.
//  Copyright (c) 2014 Jose Gustavo Rodriguez Baldera. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CartItem;
@interface CheckoutHeaderview : UIView
@property (strong, nonatomic) IBOutlet UILabel *subtotal;
@property (strong, nonatomic) IBOutlet UILabel *total;
@property (strong, nonatomic) IBOutlet UIButton *checkoutButton;
@property (nonatomic, strong) CartItem *cartItem;
@end
