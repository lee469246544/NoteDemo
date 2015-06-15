//
//  NoteModel.m
//  NoteDemo
//
//  Created by 1 on 15/5/21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "NoteModel.h"

@implementation NoteModel
- (id)init
{
    self = [super init];
    if (self) {
        self.time = [self getCurrentTime];
    }
    return self;
}
- (NSString *)getCurrentTime{
    NSDate * senddate=[NSDate date];
    
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YY-MM-dd hh:mm"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSLog(@"locationString:%@",locationString);
    return locationString;
}


@end
