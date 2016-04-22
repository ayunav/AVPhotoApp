//
//  AVAPIManager.m
//  AVPhotoApp
//
//  Created by Ayuna Vogel on 4/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "AVAPIManager.h"

#define HomeworkURL @"https://hinge-homework.s3.amazonaws.com/client/services/homework.json"

@implementation AVAPIManager

+ (void)getPhotoImageData:(void(^)(id response, NSError *error))handler {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:HomeworkURL
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         
             handler(responseObject, nil);
         
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
             NSLog(@"%@", error);
         
         }];
}

@end
