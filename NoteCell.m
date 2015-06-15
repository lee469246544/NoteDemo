//
//  NoteCell.m
//  NoteDemo
//
//  Created by 1 on 15/5/22.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "NoteCell.h"

@implementation NoteCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1;

        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 140.0f, 44.0f)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];

        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 44.0f, 120.0f, 66.0f)];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];

        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 110.0f, 140.0f, 30.0f)];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_timeLabel];

    }
    return self;
}
@end
