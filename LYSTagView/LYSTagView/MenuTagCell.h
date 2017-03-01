//
//  MenuTagCell.h
//  LYSTagView
//
//  Created by jk on 2017/3/1.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LoadImageBlock)(UIImageView *imageView,NSString *imageUrl,NSString *placeHolderImage);

@interface MenuTagCell : UICollectionViewCell

@property(nonatomic,assign)CGFloat titleH;

@property(nonatomic,strong)NSDictionary *item;

@property(nonatomic,strong)LoadImageBlock loadImageBlock;

@end
