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

#pragma mark - 在实例化cell时回调
-(void)tagView:(LYSTagView*)tagView procellCell:(UICollectionViewCell*)cell withItem:(NSDictionary*)item;

#pragma mark - 选中标签时回调
-(void)tagView:(LYSTagView*)tagView itemSelectedAtIndex:(NSUInteger)index withItem:(NSDictionary*)item;

@end

@interface LYSTagView : UIView

#pragma mark - cell显示的内容
@property(nonatomic,copy)NSMutableArray *items;

#pragma mark - UICollectionViewCell子类型对应的Class对象 使用时 如果需要在标签中显示不同的内容可以自定义自己的UICollectionViewCell
@property(nonatomic,strong)Class cellClass;

#pragma mark - 每个标签的高度
@property(nonatomic,assign)CGFloat itemH;

#pragma mark - 每行显示的列数
@property(nonatomic,assign)NSUInteger column;

#pragma mark - 代理方法
@property(nonatomic,weak)id<LYSTagViewDelegate> delegate;

@end
