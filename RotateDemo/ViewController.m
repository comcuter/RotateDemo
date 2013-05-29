//
//  ViewController.m
//  RotateDemo
//
//  Created by HaiLee on 13-5-5.
//  Copyright (c) 2013年 Hai Lee. All rights reserved.
//

#import "ViewController.h"
#import "FirstMethodViewController.h"
#import "SecondMethodViewController.h"
#import "ThirdMethodViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    self.title = @"Select Method";
}

#pragma mark - TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"methodNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    int row = indexPath.row;
    switch (row) {
        case 0:
            cell.textLabel.text = @"第一种方法";
            break;
        case 1:
            cell.textLabel.text = @"第二种方法";
            break;
        case 2:
            cell.textLabel.text = @"第三种方法";
            break;
        default:
            NSLog(@"wrong row number");
            break;
    }
    
    return cell;
}


#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (row) {
        case 0:
        {
            FirstMethodViewController *first = [[FirstMethodViewController alloc] initWithNibName:@"FirstMethodViewController" bundle:nil];
            [self.navigationController pushViewController:first animated:YES];
            break;
        }
        case 1:
        {
            SecondMethodViewController *second = [[SecondMethodViewController alloc] initWithNibName:@"SecondMethodViewController" bundle:nil];
            [self.navigationController pushViewController:second animated:YES];
            break;
        }
        case 2:
        {
            ThirdMethodViewController *third = [[ThirdMethodViewController alloc] initWithNibName:@"ThirdMethodViewController" bundle:nil];
            [self.navigationController pushViewController:third animated:YES];
            break;
        }
        default:
            break;
    }
}


@end
