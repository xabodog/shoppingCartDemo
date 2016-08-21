//
//  ProductCell.m
//  ShoppingCartExample
//
//  Created by Jose Gustavo Rodriguez Baldera on 5/31/14.
//  Copyright (c) 2014 Jose Gustavo Rodriguez Baldera. All rights reserved.
//

#import "ProductCell.h"
#import "Product.h"

@implementation ProductCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setProduct:(Product *)product{
    _product = product;
    _productTitle.text = product.name;
    _productPrice.text = [NSString stringWithFormat:@"$ %@",product.price];
    NSString *imageName = product.image;
    _productImage.image = [UIImage imageNamed:imageName];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)awakeFromNib
{
   
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
