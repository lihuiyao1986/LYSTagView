//
//  LYSTagView.m
//  LYSTagView
//
//  Created by jk on 2017/2/28.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "LYSTagView.h"

#define reuseIdentifier @"TAG_VIEW_CELL_ITEM"

@interface LYSTagView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectView;

@property(nonatomic,assign)NSUInteger currentIndex;

@end

@implementation LYSTagView


#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _cellClass = [UICollectionViewCell class];
        _items = [NSMutableArray array];
        _column = 3;
        [self initConfig];
    }
    return self;
}

#pragma mark - 初始化配置
-(void)initConfig{
    self.backgroundColor = [UIColor clearColor];
    [self buildUI];
}

#pragma mark - 创建ui
-(void)buildUI{
    [self addSubview:self.collectView];
}

#pragma mark - collectView
-(UICollectionView*)collectView{
    if(!_collectView){
        UICollectionViewFlowLayout *_flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        _collectView.dataSource = self;
        _collectView.delegate = self;
        _collectView.showsVerticalScrollIndicator = NO;
        _collectView.showsHorizontalScrollIndicator = NO;
        _collectView.scrollEnabled = NO;
        _collectView.alwaysBounceVertical = YES;
        _collectView.backgroundColor = [UIColor clearColor];
        [_collectView registerClass:_cellClass forCellWithReuseIdentifier:NSStringFromClass(_cellClass)];
    }
    return _collectView;
}

#pragma mark - 设置cell
-(void)setCellClass:(Class)cellClass{
    _cellClass = cellClass;
    [_collectView registerClass: _cellClass forCellWithReuseIdentifier:NSStringFromClass(_cellClass)];
}

#pragma mark - layoutSubviews方法
-(void)layoutSubviews{
    [super layoutSubviews];
    _collectView.frame = self.bounds;
}

#pragma mark - UICollectionViewDataSource代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *_cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(_cellClass) forIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(tagView:procellCell:withItem:)]) {
        [self.delegate tagView:self procellCell:_cell withItem:[_items objectAtIndex:indexPath.row]];
    }
    return _cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath{
    return CGSizeMake(self.bounds.size.width / _column, _itemH);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(CGFloat)collectionView:(UICollectionView*)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.f;
}

-(CGFloat)collectionView:(UICollectionView*)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.f;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(self.currentIndex != indexPath.row){
        self.currentIndex = indexPath.row;
        if ([self.delegate respondsToSelector:@selector(tagView:itemSelectedAtIndex:withItem:)]) {
            [self.delegate tagView:self itemSelectedAtIndex:indexPath.row withItem:[self.items objectAtIndex:indexPath.row]];
        }
    }
}

#pragma mark 菜单的高度
-(CGFloat)menuH{
    return _items.count == 0 ? 0 : [self rowNum] * _itemH;
}

#pragma mark - 设置item高度
-(void)setItemH:(CGFloat)itemH{
    _itemH = itemH;
    [self updateMyHeight];
}

-(void)setColumn:(NSUInteger)column{
    _column = column;
    [self updateMyHeight];
}

-(void)setItems:(NSMutableArray *)items{
    _items = items;
    [self updateMyHeight];
}

#pragma mark - 行数
-(NSUInteger)rowNum{
    return _items.count % _column == 0 ?  _items.count / _column : (_items.count / _column + 1);
}

#pragma mark - 更新视图的高度
-(void)updateMyHeight{
       self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, [self menuH]);
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
