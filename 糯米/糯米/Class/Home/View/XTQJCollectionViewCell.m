//
//  XTQJCollectionViewCell.m
//  糯米
//
//  Created by tarena41 on 16/6/25.
//  Copyright © 2016年 tarena41. All rights reserved.
//

#import "XTQJCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation XTQJCollectionViewCell
-(void)setCategory:(XTQJCategory *)category{
    self.titleLabel.text = category.category_name;
    [self.imageView setImageWithURL:[NSURL URLWithString:category.category_picurl]];
}
- (void)awakeFromNib {
    // Initialization code
}

@end
