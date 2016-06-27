//
//  XTQJCategory.h
//  糯米
//
//  Created by tarena41 on 16/6/25.
//  Copyright © 2016年 tarena41. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface XTQJCategory : JSONModel
@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, copy) NSString *category_picurl;

@end
