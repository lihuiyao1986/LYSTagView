//
//  ChargeSumTagCell.m
//  LYSTagView
//
//  Created by jk on 2017/3/1.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "ChargeSumTagCell.h"

@interface ChargeSumTagCell (){
    UILabel *_label;
}

@end

@implementation ChargeSumTagCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _selectedBorderColor = [UIColor clearColor];
        _selectedBgColor = [self colorWithHexString:@"ffc833" alpha:1.0];
        _normalBorderColor = [self colorWithHexString:@"414141" alpha:1.0];
        _normalBgColor = [UIColor clearColor];
        [self buildUI];
    }
    return self;
}

#pragma mark - 生成16进制颜色
-(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

#pragma mark - 创建UI
-(void)buildUI{
    _label = [[UILabel alloc]init];
    _label.layer.cornerRadius = 4;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:14];
    _label.layer.borderWidth = 0.5;
    _label.layer.masksToBounds = true;
    [self.contentView addSubview:_label];
}

#pragma mark - 设置item
-(void)setItem:(NSDictionary *)item{
    _item = item;
    NSString* selected = [self.item objectForKey:@"selected"];
    if (selected && [selected isEqualToString:@"1"]) {
        _label.textColor = [UIColor whiteColor];
        _label.backgroundColor = self.selectedBgColor;
        _label.layer.borderColor = _selectedBorderColor.CGColor;
    }else{
        _label.textColor = self.normalBorderColor;
        _label.backgroundColor = self.normalBgColor;
        _label.layer.borderColor = self.normalBorderColor.CGColor;
    }
    _label.text = [self.item objectForKey:@"sumValue"];
}


#pragma mark - 重写 layoutSubviews
-(void)layoutSubviews{
    [super layoutSubviews];
    _label.frame = CGRectMake(10, 10, self.bounds.size.width - 20, self.bounds.size.height - 20);
}

@end
