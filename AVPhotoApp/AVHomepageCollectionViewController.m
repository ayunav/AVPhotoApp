//
//  AVHomepageCollectionViewController.m
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "AVHomepageCollectionViewController.h"
#import "AVPhotoStore.h"

@interface AVHomepageCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout>

@property (nonatomic) NSMutableArray *photos;

@end


@implementation AVHomepageCollectionViewController

static NSString *const reuseIdentifier = @"AVHomepageCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(photoStoreDidChange:)
                                                 name:@"AVPhotoStoreDidChangeNotification"
                                               object:nil];
    
    AVPhotoStore *photoStore = [AVPhotoStore sharedPhotoStore];
    
    [photoStore fetchPhotos:^(NSMutableArray<AVPhoto *> *photos) {
        
        self.photos = photos;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
    
}


- (void)photoStoreDidChange:(NSNotification *)notification {
    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AVHomepageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    AVPhoto *photo = self.photos[indexPath.row];

    [cell.photoImageView sd_setImageWithURL:photo.imageURL
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                      
                                      cell.photoImageView.image = image;
                                      
                                  }];
    
    return cell;
}


#pragma mark - CollectionView Layout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat picDimension = self.view.frame.size.width / 3.0f;
    return CGSizeMake(picDimension, picDimension);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {

    CGFloat leftRightInset = self.view.frame.size.width / 14.0f;
    return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset);
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"GalleryViewSegueIdentifier"]) {
        
        AVGalleryViewController *galleryVC = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        
        AVPhoto *photo = [self.photos objectAtIndex:indexPath.row];
        
        galleryVC.photo = photo;
        galleryVC.imageArray = self.photos;
    }    
}


@end
