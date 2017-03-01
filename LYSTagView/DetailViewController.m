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
#import "ChargeSumTagCell.h"

@interface DetailViewController ()<LYSTagViewDelegate>{
    LYSTagView * tagView;
    LYSTagView * sumTagView;
}

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
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
//    }
    
    tagView = [[LYSTagView alloc]initWithFrame:CGRectMake(0, 120, CGRectGetWidth(self.view.frame), 20)];
    NSMutableArray *data = [NSMutableArray array];
    [data addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"name":@"李焱生"}]];
    [data addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"name":@"liyansheng"}]];
    [data addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"name":@"王思聪"}]];
    [data addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"name":@"郭靖"}]];
    [data addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"name":@"郭靖"}]];
    [data addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"name":@"郭靖"}]];
    tagView.items = data;
    tagView.column = 4;
    tagView.itemH = 60.f;
    tagView.cellClass = [MyTagCell class];
    tagView.delegate = self;
    [self.view addSubview:tagView];
    
    
    //
    sumTagView = [[LYSTagView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tagView.frame), CGRectGetWidth(self.view.frame), 20)];
    NSMutableArray *data1 = [NSMutableArray array];
    [data1 addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"sumValue":@"100"}]];
    [data1 addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"sumValue":@"200"}]];
    [data1 addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"sumValue":@"300"}]];
    [data1 addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"sumValue":@"400"}]];
    [data1 addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"sumValue":@"500"}]];
    [data1 addObject:[NSMutableDictionary dictionaryWithDictionary:@{@"sumValue":@"600"}]];
    sumTagView.items = data1;
    sumTagView.column = 3;
    sumTagView.itemH = 60.f;
    sumTagView.cellClass = [ChargeSumTagCell class];
    sumTagView.delegate = self;
    [self.view addSubview:sumTagView];
    
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
    }else if([cell isKindOfClass:[ChargeSumTagCell class]]){
        ((ChargeSumTagCell*)cell).item = item;
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
