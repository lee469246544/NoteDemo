//
//  RootViewController.m
//  NoteDemo
//
//  Created by 1 on 15/5/21.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    NSArray *notes;
    UICollectionView *collection;
}
@end

@implementation RootViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"笔记";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    notes = [SQLManager getNoteList];
    self.view.backgroundColor = [UIColor iOS7greenColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote)];
    leftItem.tintColor =[UIColor iOS7greenColor];
    self.navigationItem.leftBarButtonItem  = leftItem;
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collection.backgroundColor = [UIColor clearColor];
    [collection registerClass:[NoteCell class] forCellWithReuseIdentifier:@"cell"];
    collection.delegate = self;
    collection.dataSource = self;
    [self.view addSubview:collection];
    
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    notes = [SQLManager getNoteList];
    [collection reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addNote
{
    AddNoteViewController *noteControl = [AddNoteViewController new];
    [self.navigationController pushViewController:noteControl animated:YES];
}
#pragma mark - UICollectionViewDelegate
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return notes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NoteModel *noteModel = notes[indexPath.row];
    cell.backgroundColor = noteModel.bgColor;
    cell.titleLabel.text = noteModel.title;
    cell.contentLabel.text = noteModel.content;
    cell.timeLabel.text = noteModel.time;
    return cell;
    
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(140.0f, 140.0f);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
}

@end
