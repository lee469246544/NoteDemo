//
//  NoteModel.h
//  NoteDemo
//
//  Created by 1 on 15/5/21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteModel : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) UIColor *bgColor;
@end
