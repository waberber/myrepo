//
//  Note.h
//  Persistencelayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property (strong,nonatomic)NSString *date;
@property (strong,nonatomic)NSString *content;
@property NSInteger Id;

-(instancetype) initWithDate:(NSString*) theDate content:(NSString*) theContent;
-(instancetype) initWithDate:(NSString*) theDate content:(NSString*) theContent Id:(NSInteger) theId;

@end
