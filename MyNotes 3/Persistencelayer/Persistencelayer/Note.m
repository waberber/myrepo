//
//  Note.m
//  Persistencelayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize date,content,Id;

-(instancetype) initWithDate:(NSString*) theDate content:(NSString*) theContent
{
    self =  [super init];
    if (self) {
        self.date = theDate;
        self.content = theContent;
    }
    
    return  self;
}

-(instancetype) initWithDate:(NSString*) theDate content:(NSString*) theContent Id:(NSInteger) theId
{
    self =  [super init];
    if (self) {
        self.date = theDate;
        self.content = theContent;
        self.Id = theId;
    }
    
    return  self;}

@end
