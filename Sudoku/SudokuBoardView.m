//
//  BoardView.m
//  Sudoku
//
//  Created by David Parrott on 4/11/13.
//  Copyright (c) 2013 WSUV. All rights reserved.
//

#import "SudokuBoardView.h"
#import "SudokuBoard.h"

@implementation SudokuBoardView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)awakeFromNib {
    _selectedCol = _selectedRow = -1;
}

static const CGFloat margin = 2;

- (void)drawRect:(NSRect)dirtyRect
{
    const CGFloat gridWidth = self.bounds.size.width - 2*margin;
    const CGFloat gridHeight = self.bounds.size.height - 2*margin;
    
    if (_selectedRow >= 0 && _selectedCol >= 0){
        NSRect rect = NSMakeRect(margin + _selectedCol * gridWidth/9, margin+_selectedRow*gridHeight/9, gridWidth/9, gridHeight/9);
        [[NSColor lightGrayColor] setFill];
        [NSBezierPath fillRect: rect];
    }
    
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


    if (self.board != nil){
        NSMutableDictionary *textAttributes = [[NSMutableDictionary alloc] init];
        NSFont *font = [NSFont systemFontOfSize:30.0];
        [textAttributes setObject:font forKey:NSFontAttributeName];
        [textAttributes setObject:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
        NSMutableDictionary *fixedTextAttributes = [[NSMutableDictionary alloc] init];
        NSFont *fixedFont = [NSFont boldSystemFontOfSize:30.0];
        [fixedTextAttributes setObject:fixedFont forKey:NSFontAttributeName];
        [fixedTextAttributes setObject:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
        
        for (int row = 0; row <= 9; row++){
            for( int col = 0; col < 9; col++){
                const int num = [self.board numberAtRow:row Column:col];
                if (num > 0){
                    NSString *text = [NSString stringWithFormat:@"%d", num];
                    NSSize textSize = [text sizeWithAttributes:textAttributes];
                    blockRect.origin.x = col*gridWidth/9 + margin;
                    blockRect.origin.y = row*gridHeight/9 + margin;

                    NSDictionary *attr;
                    if([self.board numberIsFixedAtRow:row Column:col]){
                        attr = fixedTextAttributes;
                    }else {
                        attr = textAttributes;
                    }
                    
                    NSRect textRect = NSMakeRect(blockRect.origin.x + (blockRect.size.width - textSize.width)/2,
                                                 blockRect.origin.y + (blockRect.size.height - textSize.height)/2,
                                                 textSize.width, textSize.height);
                    [text drawInRect:textRect withAttributes:attr];
                }
            }
    
        }

    }
}

-(void)mouseDown:(NSEvent *)theEvent {
    NSPoint windowPoint = [theEvent locationInWindow];
    NSPoint viewPoint = [self convertPoint:windowPoint fromView:nil];
    
    const CGFloat gridWidth = self.bounds.size.width - 2*margin;
    const CGFloat gridHeight = self.bounds.size.height - 2*margin;
    
    const int col = (int) ((viewPoint.x - margin) / gridWidth);
    const int row = (int) ((viewPoint.y - margin) / gridHeight);
    
    if ( 0 <= col < 9 && 0 <= row < 9){
        if (col != _selectedCol || row != _selectedRow) {
            _selectedCol = col;
            _selectedRow = row;
        }
    }
}

@end
