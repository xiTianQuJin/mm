//
//  XTQJCollectionViewCell.h
//  糯米
//
//  Created by tarena41 on 16/6/25.
//  Copyright © 2016年 tarena41. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XTQJCategory.h"
@interface XTQJCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) XTQJCategory *category;
@end
