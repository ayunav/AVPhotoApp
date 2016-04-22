//
//  AVHomepageCollectionViewController.m
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "AVHomepageCollectionViewController.h"

@interface AVHomepageCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end


@implementation AVHomepageCollectionViewController

static NSString * const reuseIdentifier = @"AVHomepageCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

    [self setupUI];
    [self fetchAPIData];

}

- (void)fetchAPIData {
    
    self.photoImageObjects = [[NSArray alloc] init];
    
    [AVAPIManager getPhotoImageData:^(id response, NSError *error) {
        self.photoImageObjects = response;
//        NSLog(@"%@ self.photoimagepbjects", self.photoImageObjects);
//        NSLog(@"count is %ld", self.photoImageObjects.count);
        
        //        photoImageObject.imageURL = self.photoImageObjects[@"imageURL"];
        //        photoImageObject.imageURL = self.photoImageObjects[@"imageURL"];
        //        photoImageObject.imageURL = self.photoImageObjects[@"imageURL"];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    AVPhotoImage *photoImageObject = [[AVPhotoImage alloc]init];
    
    // an array of dictionaries
    

}

- (void)setupUI {
    
    CGFloat leftAndRightPaddings = 6.0;
    CGFloat numberOfItemsPerRow = 3.0;
    
    CGFloat heightAdjustment = 30.0;
    CGFloat width = (CGRectGetWidth(self.collectionView.frame) - leftAndRightPaddings)/numberOfItemsPerRow;
    
    UICollectionViewFlowLayout *layout = self.collectionViewLayout;
    layout.itemSize = CGSizeMake(width, width + heightAdjustment);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (void)fetchImageData {
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    
//    [manager GET:HomeworkURL
//      parameters:nil
//        progress:nil
//         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//             
//             NSError *error;
//             
//             NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
//             
//             NSString *imageURL = [jsonDict objectForKey:@"imageURL"];
//             
//             
//             dispatch_async(dispatch_get_global_queue(0,0), ^{
//                 NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageURL]];
//                 if ( data == nil )
//                     return;
//                 dispatch_async(dispatch_get_main_queue(), ^{
//                     // self.catImageView.image = [UIImage imageWithData:data];
//                     
//                 });
//             });
//             
//         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//             NSLog(@"fail:%@", error);
//         }];
//    
//    
//}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoImageObjects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AVHomepageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSDictionary *photoImageObject = self.photoImageObjects[indexPath.row];
    cell.imageName.text = photoImageObject[@"imageName"];
    
//    [cell.photoImageView sd_setImageWithURL:[NSURL URLWithString:self.imageURLArray[indexPath.row]]
//                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                                      
//                                      cell.photoImageView.image = image;
//                                      
//                                  }];

//    AVPhotoImage *photoImage = self.photoImageObjects[indexPath.row];

    
    
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
   
    // ?
    cell.layer.masksToBounds = YES;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
