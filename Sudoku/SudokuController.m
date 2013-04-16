//
//  SudokuController.m
//  Sudoku
//
//  Created by David Parrott on 4/11/13.
//  Copyright (c) 2013 WSUV. All rights reserved.
//

#import "SudokuController.h"
#import "SudokuBoard.h"

@implementation SudokuController {
    SudokuBoard *sudokuBoard;
}

-(void)loadNewGame {
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"sudoku-easy" ofType:@"plist"];
    NSArray *games = [NSArray arrayWithContentsOfFile:fileName];
    NSString *game = [games objectAtIndex:arc4random() % [games count]];
    [sudokuBoard freshGame:game];
    
    [self.boardView setNeedsDisplay:YES];
    
}

-(void)awakeFromNib {
    sudokuBoard = [[SudokuBoard alloc] init];
    self.boardView.board = sudokuBoard;
    [self loadNewGame];
}

//tags are set to
#define DELETE_BUTTON 10
#define PENCIL_BUTTON 11
#define NEWGAME_BUTTON 12

- (IBAction)buttonMatrixClick:(id)sender {
    NSButtonCell *bcell = [sender selectedCell];
    NSLog(@"%d", (int) bcell.tag);
}
@end
