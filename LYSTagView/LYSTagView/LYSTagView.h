//
//  LYSTagView.h
//  LYSTagView
//
//  Created by jk on 2017/2/28.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYSTagView;

@protocol LYSTagViewDelegate <NSObject>

-(void)tagView:(LYSTagView*)tagView procellCell:(UICollectionViewCell*)cell withItem:(NSDictionary*)item;

-(void)tagView:(LYSTagView*)tagView itemSelectedAtIndex:(NSUInteger)index withItem:(NSDictionary*)item;

@end

@interface LYSTagView : UIView

@property(nonatomic,copy)NSMutableArray *items;

@property(nonatomic,strong)Class cellClass;

@property(nonatomic,assign)CGFloat itemH;

@property(nonatomic,assign)NSUInteger column;

@property(nonatomic,weak)id<LYSTagViewDelegate> delegate;

@end
