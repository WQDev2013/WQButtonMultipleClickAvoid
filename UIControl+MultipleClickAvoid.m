//
//  UIControl+MultipleClickAvoid.m
//  WQButtonMultipleClickAvoid
//
//  Created by chenweiqiang on 2019/3/21.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import "UIControl+MultipleClickAvoid.h"
#import <objc/runtime.h>

static char * const eventIntervalKey = "eventIntervalKey";
static char * const eventUnavailableKey = "eventUnavailableKey";

@interface UIControl ()

@property (nonatomic, assign) BOOL eventUnavailable;

@end

@implementation UIControl (MultipleClickAvoid)

+ (void)load {
    
    Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method wq_method = class_getInstanceMethod(self, @selector(wq_sendAction:to:forEvent:));
    method_exchangeImplementations(method, wq_method);
}

#pragma mark - Action functions

- (void)wq_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (self.eventUnavailable == NO) {//默认按钮可用，第一次条件成立
        self.eventUnavailable = YES;//设置按钮不可用，防重复点击
        [self wq_sendAction:action to:target forEvent:event];
        [self performSelector:@selector(setEventUnavailable:) withObject:@(NO) afterDelay:self.eventInterval];//在指定时间间隔后设置回复按钮可用
    }
}

#pragma mark - Setter & Getter functions

- (NSTimeInterval)eventInterval {
    
    return [objc_getAssociatedObject(self, eventIntervalKey) doubleValue];
}

- (void)setEventInterval:(NSTimeInterval)eventInterval {
    
    objc_setAssociatedObject(self, eventIntervalKey, @(eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)eventUnavailable {

    return [objc_getAssociatedObject(self, eventUnavailableKey) boolValue];
}

- (void)setEventUnavailable:(BOOL)eventUnavailable {

    objc_setAssociatedObject(self, eventUnavailableKey, @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
