//
//  JPButtonGroup.m
//  HowAboutWeHD
//
//  Created by James on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JPButtonGroup.h"
#import <objc/runtime.h>

static char JPButtonSelectedKey;

@implementation JPButtonGroup
@synthesize buttonsArray;
@synthesize allowsMultipleSelection;

- (id)init {
    if (self == [super init]) {
        self.buttonsArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)clearSelections {
    for (UIButton *arrayButton in self.buttonsArray) {
        objc_removeAssociatedObjects(arrayButton);
    }
}

- (void)selectButton:(UIButton *)button {
    if (!self.allowsMultipleSelection) {
        [self clearSelections];
    }
    
    for (UIButton *arrayButton in self.buttonsArray) {
        if (arrayButton == button) {
            objc_setAssociatedObject(arrayButton, &JPButtonSelectedKey,  [NSNumber numberWithBool:YES], OBJC_ASSOCIATION_COPY_NONATOMIC);
        }
    }
}

- (NSArray *)getSelectedButtons {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (UIButton *arrayButton in self.buttonsArray) {
        NSNumber *number = (NSNumber *)objc_getAssociatedObject(arrayButton, &JPButtonSelectedKey);
        if ([number boolValue]) {
            [array addObject:arrayButton];
        }
    }
    
    return array;
}

@end
