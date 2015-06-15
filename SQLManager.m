//
//  SQLManager.m
//  NoteDemo
//
//  Created by 1 on 15/5/21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "SQLManager.h"

@implementation SQLManager
+ (void)insertNewData:(NoteModel *)model
{
    NSString *path =[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/note.db"];
    NSLog(@"%@",path);
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    if (![db open]) {
        [db close];
        NSLog(@"NO");
        return;
    }
    
    NSString *sqliteString = @"  create  table if not exists note (id integer primary key , title text , content text ,time text,color text); ";
    [db executeUpdate:sqliteString];
    
    
    NSString *RGBValue = [NSString stringWithFormat:@"%@",model.bgColor];

    [db executeUpdateWithFormat:@"insert into note(title,content,time,color) VALUES (%@ ,%@ ,%@ ,%@)",model.title,model.content,model.time,RGBValue];
    [db close];
    
}
+ (NSArray *)getNoteList
{
    NSString *path =[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/note.db"];
    NSLog(@"%@",path);
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    if (![db open]) {
        [db close];
        NSLog(@"NO");
        return nil;
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    FMResultSet *s = [db executeQuery:@"SELECT * FROM note"];
    while ([s next]) {
        NSString *title = [s stringForColumnIndex:1];
        NSString *content = [s stringForColumnIndex:2];
        NSString *time = [s stringForColumnIndex:3];
        NSString *color = [s stringForColumnIndex:4];
        NoteModel *noteModel = [NoteModel new];
        noteModel.title = title;
        noteModel.content = content;
        noteModel.time = time;
        NSLog(@"---%@",title);
        
        noteModel.bgColor =[self stringChangedColor:color];
        [arr addObject:noteModel];
    }
    
    return arr;

}
+(UIColor *)stringChangedColor:(NSString *)RGBValue
{
    NSArray *RGBArr = [RGBValue componentsSeparatedByString:@" "];
    float r = [[RGBArr objectAtIndex:1] floatValue];
    float g = [[RGBArr objectAtIndex:2] floatValue];
    float b = [[RGBArr objectAtIndex:3] floatValue];
    float a = [[RGBArr objectAtIndex:4] floatValue];
    return [UIColor colorWithRed:r green:g blue:b alpha:a];

}
@end
