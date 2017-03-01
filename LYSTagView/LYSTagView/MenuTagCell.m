//
//  MenuTagCell.m
//  LYSTagView
//
//  Created by jk on 2017/3/1.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "MenuTagCell.h"


@interface MenuTagCell (){
    UILabel *_titleLb;
    UIImageView *_menuIcon;
}

@end

@implementation MenuTagCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleH = 30.f;
        [self initConfig];
    }
    return self;
}

#pragma mark - 初始化配置
-(void)initConfig{
    
    [self setupUI];
    
}

#pragma mark - 初始化ui
-(void)setupUI{
    
    _titleLb = [[UILabel alloc]init];
    _titleLb.textAlignment = NSTextAlignmentCenter;
    _titleLb.font = [UIFont systemFontOfSize:10];
    _titleLb.textColor = [self colorWithHexString:@"414141" alpha:1.0];
    _titleLb.lineBreakMode = NSLineBreakByTruncatingTail;
    [self addSubview:_titleLb];
    
    _menuIcon = [[UIImageView alloc]init];
    _menuIcon.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_menuIcon];
}


#pragma mark - layoutSubviews方法
-(void)layoutSubviews{
    [super layoutSubviews];
    _titleLb.frame = CGRectMake(0, CGRectGetHeight(self.frame)-_titleH, self.frame.size.width, _titleH);
    _menuIcon.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetHeight(self.frame) -_titleH);
}


#pragma mark - 设置item
-(void)setItem:(NSDictionary *)item{
    _item = item;
    _titleLb.text = [self.item objectForKey:@"title"];
    if (self.loadImageBlock) {
        self.loadImageBlock(_menuIcon,[self.item objectForKey:@"imageUrl"],[self.item objectForKey:@"placeHolderImage"]);
    }
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

@end
