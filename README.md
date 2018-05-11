# useredButton
resist button 
```
    ZG_RegistButton *btn = [[ZG_RegistButton alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    [btn setRegistButtonWithTitle:@"注册" withTitleColor:[UIColor redColor] withBackgroudColor:[UIColor blueColor]];
    btn.delegate = self;
    [self.view addSubview:btn];
    btn.shadowColor = [UIColor redColor];
```
```
- (void)registButtonAction:(UIButton *)sender {
    NSLog(@"regist button click");
}
```

timing button
```
    ZG_TimingButton *btn = [[ZG_TimingButton alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    [btn setTimingButtonWithNormalTitle:@"send code" withTitleColor:[UIColor whiteColor] withBackgroudColor:[UIColor blueColor]];
    [self.view addSubview:btn];
    btn.deleagate = self;
    btn.timingStr = @"little";
```

```
- (void)timingButtonClickAction:(UIButton *)sender {
    NSLog(@"timing button click");
}
```
