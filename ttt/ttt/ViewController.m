//
//  ViewController.m
//  ttt
//
//  Created by fengdongkai on 2019/10/11.
//  Copyright © 2019 fengdongkai. All rights reserved.
//

#import "ViewController.h"
#import "HSStockChartView.h"
#import "HSStockChartModelGroup.h"
#import "UIView+T.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ViewController ()
@property (nonatomic,strong) HSStockChartView *chartView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chartView = [[HSStockChartView alloc]init];
    HSStockChartModelGroup * group = [[HSStockChartModelGroup alloc] init];
    
    
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i=0;i<100;i++)
    {
        HSStockChartModel *model = [HSStockChartModel new];
        model.date = [[NSDate dateWithTimeIntervalSinceNow:0]timeIntervalSinceNow];
        model.open = 3004.7383 + (arc4random() % 10)-5;
        model.close = 3011.0588 + (arc4random() % 10)-5;
        model.high = 3014.8474 + (arc4random() % 10)-5;
        model.low = 2990.9247 + (arc4random() % 10)-5;
        model.vol = 156755+ (arc4random() % 100)-50;;
        model.MA5_Number = 3024.08+ (arc4random() % 10)-5;;
        model.MA10_Number = 3006.26+ (arc4random() % 10)-5;;
        model.MA20_Number = 2961.36+ (arc4random() % 10)-5;;
        model.isRise = true;
        [array addObject:model];
    }

    group.chartModelArray = array;
    self.chartView.modelGroup = group;
    [self.chartView reloadData];
    self.chartView.frame = self.view.bounds;
    [self.view addSubview:self.chartView];
}


@end
