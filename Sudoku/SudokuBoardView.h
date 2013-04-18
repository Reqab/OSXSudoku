//
//  BoardView.h
//  Sudoku
//
//  Created by David Parrott on 4/11/13.
//  Copyright (c) 2013 WSUV. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SudokuBoard;

@interface SudokuBoardView : NSView

@property (strong, nonatomic) SudokuBoard *board;
@property (assign, nonatomic) int selectedRow;
@property (assign, nonatomic) int selectedCol;

@end
