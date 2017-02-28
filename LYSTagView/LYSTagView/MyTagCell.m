//
//  MyTagCell.m
//  LYSTagView
//
//  Created by jk on 2017/2/28.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "MyTagCell.h"

@interface MyTagCell ()

@property(nonatomic,strong)UILabel *label;

@end

@implementation MyTagCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}

-(void)initConfig{
    self.backgroundColor = [UIColor clearColor];
    self.label = [[UILabel alloc]init];
    self.label.textColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor greenColor];
    self.label.font = [UIFont systemFontOfSize:14];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.numberOfLines = 1;
    self.label.layer.cornerRadius = 8;
    self.label.layer.masksToBounds = YES;
    [self.contentView addSubview:self.label];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.label.frame = CGRectMake(10, 10, self.bounds.size.width -20, self.bounds.size.height - 20);
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.label.text = [self.item objectForKey:@"name"];
}

@end
