//
//  BoardView.m
//  Sudoku
//
//  Created by David Parrott on 4/11/13.
//  Copyright (c) 2013 WSUV. All rights reserved.
//

#import "BoardView.h"

@implementation BoardView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    const CGFloat margin = 2;
    const CGFloat gridWidth = self.bounds.size.width - 2*margin;
    const CGFloat gridHeight = self.bounds.size.height - 2*margin;
    
    [[NSColor blackColor] setStroke];
    [NSBezierPath setDefaultLineWidth:2*margin];
    
    NSRect blockRect = NSMakeRect(0, 0, gridWidth/3, gridHeight/3);
    for (int row = 0; row <= 3; row++){
        for( int col = 0; col < 3; col++){
            blockRect.origin.x = col*gridWidth/3 + margin;
            blockRect.origin.y = row*gridHeight/3 + margin;
            [NSBezierPath strokeRect:blockRect];
        }
    }
    
    [NSBezierPath setDefaultLineWidth:margin];
    blockRect.size.width/=3;
    blockRect.size.height/=3;
    for (int row = 0; row <= 9; row++){
        for( int col = 0; col < 9; col++){
            blockRect.origin.x = col*gridWidth/9 + margin;
            blockRect.origin.y = row*gridHeight/9 + margin;
            [NSBezierPath strokeRect:blockRect];
        }
    }
}

@end
