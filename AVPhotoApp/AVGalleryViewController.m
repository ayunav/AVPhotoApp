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

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(photoStoreDidChange:)
                                                 name:@"AVPhotoStoreDidChangeNotification"
                                               object:nil];
    
    AVPhotoStore *photoStore = [AVPhotoStore sharedPhotoStore];
    self.currentIndex = [photoStore indexOfPhoto:self.photo];

    [self.photoImageView sd_setImageWithURL:self.photo.imageURL
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                      
                                      self.photoImageView.image = image;
                                  }];
    
    [self changeImageWithInterval];
}


- (void)photoStoreDidChange:(NSNotification *)notification {
    // Do something when the photo store changes
   
}

- (void)changeImageWithInterval {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                  target:self
                                                selector:@selector(changeImageTimerFired:)
                                                userInfo:nil
                                                 repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    [self.timer fire];
}


- (void)changeImageTimerFired:(NSTimer *)timer {
    
    if (self.currentIndex > self.imageArray.count - 1) {
        self.currentIndex = 0;
    }
    
    self.navigationItem.title = [NSString stringWithFormat:@"%ld/%ld", self.currentIndex + 1,  self.imageArray.count];
    
    self.photo = [self.imageArray objectAtIndex:self.currentIndex++];
    
    [self.photoImageView sd_setImageWithURL:self.photo.imageURL
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                      
                                      self.photoImageView.image = image;
                                  }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewDidDisappear:(BOOL)animated {
    [self.timer invalidate];
}


- (IBAction)deleteButtonTapped:(UIBarButtonItem *)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                   message:@"Are you sure you want to delete this image?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
//                                                              AVPhotoStore *photoStore = [AVPhotoStore sharedPhotoStore];
//                                                              NSInteger index = [photoStore indexOfPhoto:self.photo];
//                                                              [photoStore removePhotoAtIndex:index]; 
//                                                              
//                                                              SDImageCache *sharedImageCache = [SDImageCache sharedImageCache];
//                                                              [sharedImageCache removeImageForKey:self.photo.imageURLString];
                                                              
                                                          }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {}];

    [alert addAction:confirmAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
