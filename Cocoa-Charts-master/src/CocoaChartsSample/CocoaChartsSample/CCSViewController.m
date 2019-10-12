//
//  CCSViewController.m
//  Cocoa-Charts
//
//  Created by limc on 13-05-22.
//  Copyright (c) 2012 limc.cn All rights reserved.
//

#import "CCSViewController.h"
#import "CCSAppDelegate.h"
#import "CCSGridChartViewController.h"
#import "CCSLineChartViewController.h"
#import "CCSStickChartViewController.h"
#import "CCSMAStickChartViewController.h"
#import "CCSCandleStickChartViewController.h"
#import "CCSMACandleStickChartViewController.h"
#import "CCSPieChartViewController.h"
#import "CCSPizzaChartViewController.h"
#import "CCSSpiderWebChartViewController.h"
#import "CCSMinusStickChartViewController.h"
#import "CCSMACDChartViewController.h"
#import "CCSAreaChartViewController.h"
#import "CCSStackedAreaChartViewController.h"
#import "CCSBandAreaChartViewController.h"
#import "CCSRadarChartViewController.h"
#import "CCSSlipStickChartViewController.h"
#import "CCSColoredStickChartViewController.h"
#import "CCSSlipCandleStickChartViewController.h"
#import "CCSMASlipCandleStickChartViewController.h"
#import "CCSBOLLMASlipCandleStickChartViewController.h"
#import "CCSSlipLineChartViewController.h"
#import "CCSSimpleDemoViewController.h"
#import "CCSDonutChartViewController.h"

#import "CCSSampleGroupChartDemoViewController.h"
#import "CCSSampleGroupChartHorizontalViewController.h"

@interface CCSViewController () {
}

@end

@implementation CCSViewController
@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                  style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
            | UIViewAutoresizingFlexibleTopMargin
            | UIViewAutoresizingFlexibleRightMargin
            | UIViewAutoresizingFlexibleBottomMargin
            | UIViewAutoresizingFlexibleHeight
            | UIViewAutoresizingFlexibleWidth;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.title = @"Cocoa-Charts v0.2.1.1";
    self.navigationController.navigationBarHidden = NO;
    
    // Index path for selected row
    NSIndexPath *selectedRow = [self.tableView indexPathForSelectedRow];
    
    // Deselet the row with animation
    [self.tableView deselectRowAtIndexPath:selectedRow animated:YES];
    
    // Scroll the selected row to the center
    [self.tableView scrollToRowAtIndexPath:selectedRow
                          atScrollPosition:UITableViewScrollPositionMiddle
                                  animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 22;
    }

    return 0;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UILabel *lblTitle = [[UILabel alloc] init];
        lblTitle.backgroundColor = [UIColor grayColor];
        lblTitle.textColor = [UIColor whiteColor];
        lblTitle.text = @"Charts Demo";
        return lblTitle;
    } else if (section == 1) {
        UILabel *lblTitle = [[UILabel alloc] init];
        lblTitle.backgroundColor = [UIColor grayColor];
        lblTitle.textColor = [UIColor whiteColor];
        lblTitle.text = @"Single Chart Demo";
        return lblTitle;
    } else {
        return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 22.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Simple Demo";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"Simple Horizontal Demo";
        }else{
            cell.textLabel.text = @"Simple GroupChart Demo";
        }
    } else {
        NSUInteger row = indexPath.row;
        //    NSLog(@"%d",row);

        if (CCSChartTypeGridChart == row) {
            cell.textLabel.text = @"GridChart";
        }
        else if (CCSChartTypeLineChart == row) {
            cell.textLabel.text = @"LineChart";
        }
        else if (CCSChartTypeStickChart == row) {
            cell.textLabel.text = @"StickChart";
        }
        else if (CCSChartTypeMAStickChart == row) {
            cell.textLabel.text = @"MAStickChart";
        }
        else if (CCSChartTypeCandleStickChart == row) {
            cell.textLabel.text = @"CandleStickChart";
        }
        else if (CCSChartTypeMACandleStickChart == row) {
            cell.textLabel.text = @"MACandleStickChart";
        }
        else if (CCSChartTypePieChart == row) {
            cell.textLabel.text = @"PieChart";
        }
        else if (CCSChartTypePizzaChart == row) {
            cell.textLabel.text = @"PizzaChart";
        }
        else if (CCSChartTypeSpiderWebChart == row) {
            cell.textLabel.text = @"SpiderWebChart";
        }
        else if (CCSChartTypeMinusStickChart == row) {
            cell.textLabel.text = @"MinusStickChart";
        }
        else if (CCSChartTypeMACDChart == row) {
            cell.textLabel.text = @"MACDChart";
        }
        else if (CCSChartTypeAreaChart == row) {
            cell.textLabel.text = @"AreaChart";
        }
        else if (CCSChartTypeStackedAreaChart == row) {
            cell.textLabel.text = @"StackedAreaChart";
        }
        else if (CCSChartTypeBandAreaChart == row) {
            cell.textLabel.text = @"BandAreaChart";
        }
        else if (CCSChartTypeRadarChart == row) {
            cell.textLabel.text = @"RadarChart";
        }
        else if (CCSChartTypeSlipStickChart == row) {
            cell.textLabel.text = @"SlipStickChart";
        }
        else if (CCSChartTypeColoredSlipStickChart == row) {
            cell.textLabel.text = @"ColoredSlipStickChart";
        }
        else if (CCSChartTypeSlipCandleStickChart == row) {
            cell.textLabel.text = @"SlipCandleStickChart";
        }
        else if (CCSChartTypeMASlipCandleStickChart == row) {
            cell.textLabel.text = @"MASlipCandleStickChart";
        }
        else if (CCSChartTypeBOLLMASlipCandleStickChart == row) {
            cell.textLabel.text = @"BOLLMASlipCandleStickChart";
        }
        else if (CCSChartTypeSlipLineChart == row) {
            cell.textLabel.text = @"SlipLineChart";
        }
        else if (CCSChartTypeDonutChart == row) {
            cell.textLabel.text = @"DonutChart";
        }
        else {
        }

    }

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UIViewController *viewController = nil;

    if (indexPath.section == 0) {
        NSUInteger row = indexPath.row;
        if (row == 0) {
            viewController = [[CCSSimpleDemoViewController alloc] init];
        }else if(row == 1){
            viewController = [[CCSSampleGroupChartHorizontalViewController alloc] init];
        }else{
            viewController = [[CCSSampleGroupChartDemoViewController alloc] init];
        }
    } else if (indexPath.section == 1) {
        NSUInteger row = indexPath.row;
        if (CCSChartTypeGridChart == row) {
            viewController = [[CCSGridChartViewController alloc] init];
        }
        else if (CCSChartTypeLineChart == row) {
            viewController = [[CCSLineChartViewController alloc] init];
        }
        else if (CCSChartTypeStickChart == row) {
            viewController = [[CCSStickChartViewController alloc] init];
        }
        else if (CCSChartTypeMAStickChart == row) {
            viewController = [[CCSMAStickChartViewController alloc] init];
        }
        else if (CCSChartTypeCandleStickChart == row) {
            viewController = [[CCSCandleStickViewController alloc] init];
        }
        else if (CCSChartTypeMACandleStickChart == row) {
            viewController = [[CCSMACandleStickChartViewController alloc] init];
        }
        else if (CCSChartTypePieChart == row) {
            viewController = [[CCSPieChartViewController alloc] init];
        }
        else if (CCSChartTypePizzaChart == row) {
            viewController = [[CCSPizzaChartViewController alloc] init];
        }
        else if (CCSChartTypeSpiderWebChart == row) {
            viewController = [[CCSSpiderWebChartViewController alloc] init];
        }
        else if (CCSChartTypeMinusStickChart == row) {
            viewController = [[CCSMinusStickChartViewController alloc] init];
        }
        else if (CCSChartTypeMACDChart == row) {
            viewController = [[CCSMACDChartViewController alloc] init];
        }
        else if (CCSChartTypeAreaChart == row) {
            viewController = [[CCSAreaChartViewController alloc] init];
        }
        else if (CCSChartTypeStackedAreaChart == row) {
            viewController = [[CCSStackedAreaChartViewController alloc] init];
        }
        else if (CCSChartTypeBandAreaChart == row) {
            viewController = [[CCSBandAreaChartViewController alloc] init];
        }
        else if (CCSChartTypeRadarChart == row) {
            viewController = [[CCSRadarChartViewController alloc] init];
        }
        else if (CCSChartTypeSlipStickChart == row) {
            viewController = [[CCSSlipStickChartViewController alloc] init];
        }
        else if (CCSChartTypeColoredSlipStickChart == row) {
            viewController = [[CCSColoredStickChartViewController alloc] init];
        }
        else if (CCSChartTypeSlipCandleStickChart == row) {
            viewController = [[CCSSlipCandleStickChartViewController alloc] init];
        }
        else if (CCSChartTypeMASlipCandleStickChart == row) {
            viewController = [[CCSMASlipCandleStickChartViewController alloc] init];
        }
        else if (CCSChartTypeBOLLMASlipCandleStickChart == row) {
            viewController = [[CCSBOLLMASlipCandleStickChartViewController alloc] init];
        }
        else if (CCSChartTypeSlipLineChart == row) {
            viewController = [[CCSSlipLineChartViewController alloc] init];
        }
        else if (CCSChartTypeDonutChart == row) {
            viewController = [[CCSDonutChartViewController alloc] init];
        }
        else {

        }
    } else {
        return;
    }
    CCSAppDelegate *appDelegate = (CCSAppDelegate *) [UIApplication sharedApplication].delegate;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        UINavigationController *navigationController = (UINavigationController *) appDelegate.viewController;
//        if ([viewController isKindOfClass:[CCSSampleHorizontalViewController class]]) {
//            [[navigationController.viewControllers lastObject] presentViewController:viewController animated:YES completion:^{
//            }];
//        }else{
//            [navigationController pushViewController:viewController animated:YES];
//        }
        [navigationController pushViewController:viewController animated:YES];
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *) appDelegate.viewController;
        UINavigationController *navigationController = [splitViewController.viewControllers objectAtIndex:1];
        [navigationController popToRootViewControllerAnimated:NO];
        [navigationController pushViewController:viewController animated:YES];
    }
}


@end
