//
//  JPButtonGroupSpec.m
//  HAWCommon
//
//  Created by James on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "kiwi.h"
#import "JPButtonGroup.h"

SPEC_BEGIN(JPButtonGroupSpec)

describe(@"JPButtonGroupSpec", ^{
    
    context(@"when created", ^{
        __block JPButtonGroup *jpButtonGroup = nil; // object under test
        
        beforeEach(^{
            jpButtonGroup = [[JPButtonGroup alloc] init];
        });
        
        it(@"should be initialized", ^{
            [jpButtonGroup shouldNotBeNil];
            [jpButtonGroup.buttonsArray shouldNotBeNil];
        });
        
        context(@"input buttons", ^{
            __block NSObject *inputButton1 = [NSObject mock];
            __block NSObject *inputButton2 = [NSObject mock];
            __block NSObject *inputButton3 = [NSObject mock];
            
            beforeEach(^{
                [jpButtonGroup.buttonsArray addObject:inputButton1];
                [jpButtonGroup.buttonsArray addObject:inputButton2];
                [jpButtonGroup.buttonsArray addObject:inputButton3];
            });
            
            it (@"should have multiple buttons", ^{
                [[jpButtonGroup.buttonsArray should] haveCountOf:3];
            });
            
            context(@"allow single selections", ^{
                beforeEach(^{
                    jpButtonGroup.allowsMultipleSelection = NO;
                });
                
                context(@"select one buttons", ^{
                    beforeEach(^{
                        [jpButtonGroup selectButton:inputButton2];
                    });
                    
                    it (@"should return one selected buttons", ^{
                        [[[jpButtonGroup getSelectedButtons] should] containObjects:inputButton2, nil];
                    });
                });
                
                context(@"select multiple buttons", ^{
                    beforeEach(^{
                        [jpButtonGroup selectButton:inputButton3];
                        [jpButtonGroup selectButton:inputButton2];
                    });
                    
                    it (@"should return one selected buttons", ^{
                        [[[jpButtonGroup getSelectedButtons] should] containObjects:inputButton2, nil];
                        [[[jpButtonGroup getSelectedButtons] shouldNot] containObjects:inputButton1, inputButton3, nil];
                    });
                });
            });
            
            context(@"allow multiple selections", ^{
                beforeEach(^{
                    jpButtonGroup.allowsMultipleSelection = YES;
                });
                
                context(@"select one buttons", ^{
                    beforeEach(^{
                        [jpButtonGroup selectButton:inputButton2];
                    });
                    
                    it (@"should return one selected buttons", ^{
                        [[[jpButtonGroup getSelectedButtons] should] containObjects:inputButton2, nil];
                    });
                });
                
                context(@"select multiple buttons", ^{
                    beforeEach(^{
                        [jpButtonGroup selectButton:inputButton3];
                        [jpButtonGroup selectButton:inputButton2];
                    });
                    
                    it (@"should return one selected buttons", ^{
                        [[[jpButtonGroup getSelectedButtons] should] containObjects:inputButton2, inputButton3, nil];
                        [[[jpButtonGroup getSelectedButtons] shouldNot] containObjects:inputButton1, nil];
                    });
                });
            });
        });
    });
});

SPEC_END
