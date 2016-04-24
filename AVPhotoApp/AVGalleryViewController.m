//
//  AVGalleryViewController.m
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>

#import "AVGalleryViewController.h"


@interface AVGalleryViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (nonatomic) NSInteger currentIndex;
@property (nonatomic) NSTimer *timer;


@end


@implementation AVGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoImageView.clipsToBounds = YES;

    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:self.photo.imageURL]
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                      
                                      self.photoImageView.image = image;

                                      self.currentIndex = [self.imageArray indexOfObject:self.photo]-1;
                                  }];
    
    
    [self changeImage];

    
    //    [self.photoImageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:self.photo.imageURL]
//                                                  placeholderImage:nil
//                                                           options:nil
//                                                          progress:nil
//                                                         completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        self.photoImageView.image = image;
//        
//        self.currentIndex = [self.imageArray indexOfObject:self.photo];
//        NSLog(@"%ld before the set image method", self.currentIndex);
//    }];

    
}

- (void)changeImage {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(changeImageTimerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}

- (void)changeImageTimerFired:(NSTimer *)timer {
    
    if (self.currentIndex <= -1) {
        self.navigationItem.title = [NSString stringWithFormat:@"%ld/%ld", self.currentIndex + 2,  self.imageArray.count];
    } else {
        self.navigationItem.title = [NSString stringWithFormat:@"%ld/%ld", self.currentIndex + 2,  self.imageArray.count];
    }
    
    if (self.currentIndex == self.imageArray.count - 1) {
        self.currentIndex = -1;
    }
    
    self.currentIndex++;
    
    self.photo = [self.imageArray objectAtIndex:self.currentIndex];
    
    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:self.photo.imageURL]
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                      
                                      self.photoImageView.image = image;
                                      self.currentIndex = [self.imageArray indexOfObject:self.photo];
                                  }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.timer invalidate];
}

- (IBAction)deleteButtonTapped:(UIBarButtonItem *)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:@"Are you sure you want to delete this image?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              SDImageCache *sharedImageCache = [SDImageCache sharedImageCache];
                                                              [sharedImageCache removeImageForKey:self.photo.imageURL];
                                                              
                                                          }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {}];

    [alert addAction:confirmAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
