//
//  ChargeSumTagCell.h
//  LYSTagView
//
//  Created by jk on 2017/3/1.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChargeSumTagCell : UICollectionViewCell

@property(nonatomic,strong)NSDictionary *item;

@property (nonatomic,strong)UIColor *selectedBorderColor;

@property (nonatomic,strong)UIColor *selectedBgColor;

@property (nonatomic,strong)UIColor *normalBorderColor;

@property (nonatomic,strong)UIColor *normalBgColor;

@end
