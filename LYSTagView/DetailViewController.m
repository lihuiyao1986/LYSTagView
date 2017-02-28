//
//  DetailViewController.m
//  LYSTagView
//
//  Created by jk on 2017/2/28.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "DetailViewController.h"
#import "LYSTagView.h"
#import "MyTagCell.h"

@interface DetailViewController ()<LYSTagViewDelegate>

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    
    LYSTagView * tagView = [[LYSTagView alloc]initWithFrame:CGRectMake(0, 120, CGRectGetWidth(self.view.frame), 20)];
    NSMutableArray *data = [NSMutableArray array];
    [data addObject:@{@"name":@"李焱生"}];
    [data addObject:@{@"name":@"liyansheng"}];
    [data addObject:@{@"name":@"王思聪"}];
    [data addObject:@{@"name":@"郭靖"}];
    [data addObject:@{@"name":@"郭靖"}];
    [data addObject:@{@"name":@"郭靖"}];
    tagView.items = data;
    tagView.column = 4;
    tagView.itemH = 60.f;
    tagView.cellClass = [MyTagCell class];
    tagView.delegate = self;
    [self.view addSubview:tagView];
    
}

-(void)tagView:(LYSTagView*)tagView procellCell:(UICollectionViewCell*)cell withItem:(NSDictionary*)item{
//    cell.backgroundColor = [UIColor greenColor];
//    int R = (arc4random() % 256) ;
//    int G = (arc4random() % 256) ;
//    int B = (arc4random() % 256) ;
//    UIView *selectView = [[UIView alloc]init];
//    selectView.backgroundColor = [UIColor redColor];
//    cell.selectedBackgroundView = selectView;
//    cell.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    if ([cell isKindOfClass:[MyTagCell class]]) {
        ((MyTagCell*)cell).item = item;
    }
}

-(void)tagView:(LYSTagView*)tagView itemSelectedAtIndex:(NSUInteger)index withItem:(NSDictionary*)item{
    NSLog(@"你选中了第%lu选项",index);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
