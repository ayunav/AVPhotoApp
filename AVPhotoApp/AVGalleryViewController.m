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

@end


@implementation AVGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoImageView.clipsToBounds = YES;

    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:self.photo.imageURL]
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                      
                                      self.photoImageView.image = image;
                                      
                                  }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
