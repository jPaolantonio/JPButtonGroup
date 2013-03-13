//
//  JPButtonGroup.h
//  HowAboutWeHD
//
//  Created by James on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JPButtonGroup : NSObject

@property BOOL allowsMultipleSelection;

- (void)clearSelections;
- (void)addButton:(UIButton *)button;
- (void)selectButton:(NSObject *)button;
- (void)selectButtonWithTag:(NSInteger)tag;
- (NSArray *)getSelectedButtons;

@end
