//
//  MeasureController.m
//  ruler
//
//  Created by Hyder SM on 2014-09-21.
//  Copyright (c) 2014 Hyder. All rights reserved.
//

#import "MeasureController.h"

@interface MeasureController ()

@property (nonatomic, strong) UIView *circleButtonView;
@property (nonatomic, strong) UILabel *numberView;
@property (nonatomic, strong) NSNumber *number;

@end

@implementation MeasureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    float sideLength = self.view.bounds.size.width*0.5;
    CGPoint center = CGPointMake(self.view.bounds.size.width/2.0 + self.view.bounds.origin.x, self.view.bounds.size.height/2.0 + self.view.bounds.origin.y);
    CGRect circleButtonRect = CGRectMake(center.x - sideLength/2.0, center.y - sideLength/2.0, sideLength, sideLength);
    self.circleButtonView = [[UIView alloc] initWithFrame:circleButtonRect];
    
    float radius = sideLength/2.0;
    self.circleButtonView.layer.cornerRadius = radius;
    self.circleButtonView.layer.borderWidth = 10.0f;
    self.circleButtonView.layer.borderColor = [[UIColor grayColor] CGColor];
    
    center = CGPointMake(self.circleButtonView.bounds.size.width/2.0 + self.circleButtonView.bounds.origin.x, self.circleButtonView.bounds.size.height/2.0 + self.circleButtonView.bounds.origin.y);
    sideLength = self.circleButtonView.bounds.size.width/2.0;
    CGRect numberViewRect = CGRectMake(center.x - sideLength/2.0, center.y - sideLength/2.0, sideLength, sideLength);
    self.numberView = [[UILabel alloc] initWithFrame:numberViewRect];
    self.numberView.textAlignment = NSTextAlignmentCenter;
    self.numberView.font = [UIFont systemFontOfSize:100];
    self.numberView.textColor = [UIColor grayColor];
    self.number = @0;
    
    [self.circleButtonView addSubview:self.numberView];
    
    [self.view addSubview:self.circleButtonView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setNumber:(NSNumber *)number
{
    _number = number;
    
    if(!self.numberView.superview)
        [self.numberView setText:[_number stringValue]];
}
@end
