//
//  UIControl+MultipleClickAvoid.h
//  WQButtonMultipleClickAvoid
//
//  Created by chenweiqiang on 2019/3/21.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (MultipleClickAvoid)

@property (nonatomic, assign) NSTimeInterval eventInterval;

@end

NS_ASSUME_NONNULL_END
