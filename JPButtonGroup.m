//
//  JPButtonGroup.m
//  HowAboutWeHD
//
//  Created by James on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JPButtonGroup.h"

@implementation JPButtonGroup
@synthesize buttonsArray;
@synthesize allowsMultipleSelection;

- (id)init {
    if (self == [super init]) {
        self.buttonsArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)selectButton:(UIButton *)button {
    
}

- (NSArray *)getSelectedButtons {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    return array;
}

@end
