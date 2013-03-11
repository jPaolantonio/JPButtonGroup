//
//  JPButtonGroupSpec.m
//  HAWCommon
//
//  Created by James on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "kiwi.h"
#import "JPButtonGroup.h"

@class UIButton;

SPEC_BEGIN(JPButtonGroupSpec)

describe(@"JPButtonGroupSpec", ^{
    
    context(@"when created", ^{
        __block JPButtonGroup *jpButtonGroup = nil; // object under test
        
        beforeEach(^{
            jpButtonGroup = nil;
            jpButtonGroup = [[JPButtonGroup alloc] init];
        });
        
        it(@"should be initialized", ^{
            [jpButtonGroup shouldNotBeNil];
        });
        
        context(@"add buttons", ^{
            __block id inputButton1 = nil;
            __block id inputButton2 = nil;
            __block id inputButton3 = nil;
            
            beforeEach(^{
                inputButton1 = [KWMock mockForClass:[UIButton class]];
                inputButton2 = [KWMock mockForClass:[UIButton class]];
                inputButton3 = [KWMock mockForClass:[UIButton class]];
                
                [inputButton1 stub:@selector(setSelected:)];
                [inputButton2 stub:@selector(setSelected:)];
                [inputButton3 stub:@selector(setSelected:)];
                
                [jpButtonGroup addButton:inputButton1];
                [jpButtonGroup addButton:inputButton2];
                [jpButtonGroup addButton:inputButton3];
            });
            
            context(@"allow single selections", ^{
                beforeEach(^{
                    jpButtonGroup.allowsMultipleSelection = NO;
                });
                
                context(@"select one buttons", ^{
                    beforeEach(^{
                        [jpButtonGroup selectButton:inputButton2];
                    });
                    
                    it (@"should return one selected button", ^{
                        [[[jpButtonGroup getSelectedButtons] should] haveCountOf:1];
                        [[[jpButtonGroup getSelectedButtons] should] contain:inputButton2];
                        [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton1];
                        [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton3];
                    });
                });
                
                context(@"select multiple buttons", ^{
                    beforeEach(^{
                        [jpButtonGroup selectButton:inputButton3];
                        [jpButtonGroup selectButton:inputButton2];
                    });
                    
                    it (@"should return one selected buttons", ^{
                        [[[jpButtonGroup getSelectedButtons] should] haveCountOf:1];
                        [[[jpButtonGroup getSelectedButtons] should] contain:inputButton2];
                        [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton1];
                        [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton3];
                    });
                });
            });
            
            context(@"allow multiple selections", ^{
                beforeEach(^{
                    jpButtonGroup.allowsMultipleSelection = YES;
                });
                
                context(@"select one buttons", ^{
                    beforeEach(^{
                        [jpButtonGroup selectButton:inputButton3];
                    });
                    
                    it (@"should return one selected buttons", ^{
                        [[[jpButtonGroup getSelectedButtons] should] haveCountOf:1];
                        [[[jpButtonGroup getSelectedButtons] should] contain:inputButton3];
                        [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton1];
                        [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton2];
                    });
                });
                
                context(@"select multiple buttons", ^{
                    beforeEach(^{
                        [jpButtonGroup selectButton:inputButton3];
                        [jpButtonGroup selectButton:inputButton2];
                    });
                    
                    it (@"should return one selected buttons", ^{
                        [[[jpButtonGroup getSelectedButtons] should] haveCountOf:2];
                        [[[jpButtonGroup getSelectedButtons] should] contain:inputButton2];
                        [[[jpButtonGroup getSelectedButtons] should] contain:inputButton3];
                        [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton1];
                    });
                });
            });
            
            context(@"clear selections", ^{
                beforeEach(^{
                    [jpButtonGroup selectButton:inputButton3];
                    [jpButtonGroup selectButton:inputButton2];
                    
                    [jpButtonGroup clearSelections];
                });
                
                it (@"should have nothing selected", ^{
                    [[[jpButtonGroup getSelectedButtons] should] haveCountOf:0];
                    [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton1];
                    [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton2];
                    [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton3];
                });
            });
            
            context(@"select and deselect", ^{
                beforeEach(^{
                    jpButtonGroup.allowsMultipleSelection = YES;
                    
                    [jpButtonGroup selectButton:inputButton1];
                    [jpButtonGroup selectButton:inputButton2];
                    [jpButtonGroup selectButton:inputButton3];
                    [jpButtonGroup selectButton:inputButton2];
                });
                
                it (@"should have nothing selected", ^{
                    [[[jpButtonGroup getSelectedButtons] should] haveCountOf:2];
                    [[[jpButtonGroup getSelectedButtons] should] contain:inputButton1];
                    [[[jpButtonGroup getSelectedButtons] should] contain:inputButton3];
                    [[[jpButtonGroup getSelectedButtons] shouldNot] contain:inputButton2];
                });
            });
        });
    });
});

SPEC_END
