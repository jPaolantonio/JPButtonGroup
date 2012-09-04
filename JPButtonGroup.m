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

- (id)init {
    if (self == [super init]) {
        self.buttonsArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)clearSelections {
    for (UIButton *arrayButton in self.buttonsArray) {
        objc_removeAssociatedObjects(arrayButton);
        arrayButton.selected = NO;
    }
}

- (void)selectButton:(UIButton *)button {
    if (!self.allowsMultipleSelection) {
        [self clearSelections];
    }
    
    for (UIButton *arrayButton in self.buttonsArray) {
        if (arrayButton == button) {
            NSNumber *number = (NSNumber *)objc_getAssociatedObject(arrayButton, &JPButtonSelectedKey);
            if ([number boolValue]) {
                objc_removeAssociatedObjects(arrayButton);
                arrayButton.selected = NO;
            }
            else {
                objc_setAssociatedObject(arrayButton, &JPButtonSelectedKey,  [NSNumber numberWithBool:YES], OBJC_ASSOCIATION_COPY_NONATOMIC);
                arrayButton.selected = YES;
            }
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
