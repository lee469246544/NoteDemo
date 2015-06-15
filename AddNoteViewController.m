//
//  AddNoteViewController.m
//  NoteDemo
//
//  Created by 1 on 15/5/21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "AddNoteViewController.h"

@interface AddNoteViewController ()
{
    UITextField *textField;
    UITextView *contentField;
    NSArray *colors;
}
@end

@implementation AddNoteViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"新建笔记";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor *color = [UIColor iOS7greenColor];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    
    self.view.backgroundColor = color;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back)];
    backItem.tintColor = color;
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveNote)];
    saveItem.tintColor = color;
    self.navigationItem.rightBarButtonItem = saveItem;
    
    
    colors = @[[UIColor iOS7redColor],[UIColor iOS7orangeColor],[UIColor iOS7yellowColor],[UIColor iOS7greenColor],[UIColor iOS7lightBlueColor]];
    float x = (width - 60.0f *colors.count)/2;
    for (int i = 0 ; i < colors.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*59.0f+x, 80.0f, 60.0f, 44.0f);
        button.backgroundColor = colors[i];
        [button addTarget:self action:@selector(changeTintColor:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor blackColor].CGColor;
        button.tag = i;
        [self.view addSubview:button];
    }

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 140.0f, 60.0f, 44.0f)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"标题";
    [self.view addSubview:label];
    
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(60.0f, 140.0f, width - 70.0f, 44)];
    textField.layer.borderColor = [UIColor blackColor].CGColor;
    textField.layer.borderWidth = 1;
    textField.layer.cornerRadius = 5;
    [self.view addSubview:textField];

    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 200.0f, 60.0f, 44.0f)];
    label1.text = @"正文";
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label1];
    
    contentField = [[UITextView alloc] initWithFrame:CGRectMake(60.0f, 200.0f, width - 70.0f, height - 210)];
    contentField.layer.borderColor = [UIColor blackColor].CGColor;
    contentField.layer.borderWidth = 1;
    contentField.layer.cornerRadius = 5;
    contentField.backgroundColor = [UIColor clearColor];
    [self.view addSubview:contentField];

}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];


}
- (void)saveNote
{
    if (textField.text.length < 1 || contentField.text.length < 1)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"消息提醒" message:@"输出内容不能为空" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
        return;
    }
    
    NoteModel *note = [NoteModel new];
    note.title = textField.text;
    note.content = contentField.text;
    note.bgColor = self.view.backgroundColor;
    [SQLManager insertNewData:note];
    
    [self back];
}
- (void)changeTintColor:(UIButton *)button
{
    NSInteger tag = button.tag;

    UIColor *color = colors[tag];
    self.view.backgroundColor = color;
    self.navigationItem.leftBarButtonItem.tintColor = color;
    self.navigationItem.rightBarButtonItem.tintColor = color;
}
@end
