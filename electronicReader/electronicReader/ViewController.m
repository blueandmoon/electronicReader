//
//  ViewController.m
//  electronicReader
//
//  Created by 李根 on 16/6/20.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "ViewController.h"
/**
 *  简易电子阅读器
 */
@interface ViewController ()
@property(nonatomic, strong)UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    //  1. 生成一张以后用于平铺的小图片
    CGSize size = CGSizeMake(self.view.frame.size.width, 26);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    
    //  2. 画矩形
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat height = 26;
    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, height));
    [[UIColor brownColor] set];
    CGContextFillPath(ctx);
    
    //  3. 画线条
    CGFloat lineWidth = 2;
    CGFloat lineY = height - lineWidth;
    CGFloat lineX = 0;
    CGContextMoveToPoint(ctx, lineX, lineY);
    CGContextAddLineToPoint(ctx, self.view.frame.size.width, lineY);
    [[UIColor blackColor] set];
    CGContextStrokePath(ctx);

    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 600)];
    [self.view addSubview:_textView];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                 NSParagraphStyleAttributeName:paragraphStyle};
    _textView.attributedText = [[NSAttributedString alloc] initWithString:@"fdsa" attributes:attributes];
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIColor *color = [UIColor colorWithPatternImage:image];
    _textView.backgroundColor = color;
    
    
}


























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
