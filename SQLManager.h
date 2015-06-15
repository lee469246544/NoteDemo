//
//  SQLManager.h
//  NoteDemo
//
//  Created by 1 on 15/5/21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "NoteModel.h"

@interface SQLManager : NSObject
+ (void)insertNewData:(NoteModel *)model;
+ (NSArray *)getNoteList;
@end
