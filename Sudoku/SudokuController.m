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

-(void)loadNewGame:(int)gameLevel {
    static NSString *levelNames[4] = {@"sudoku-easy",@"sudoku-simple", @"sudoku-intermediate", @"sudoku-expert"};
    NSString *fileName = [[NSBundle mainBundle] pathForResource:levelNames[gameLevel] ofType:@"plist"];
    
    NSArray *games = [NSArray arrayWithContentsOfFile:fileName];
    NSString *game = [games objectAtIndex:arc4random() % [games count]];
    [sudokuBoard freshGame:game];
    
    [self.boardView setNeedsDisplay:YES];
    self.boardView.selectedCol = -1;
    self.boardView.selectedRow = -1;
}

-(void)awakeFromNib {
    sudokuBoard = [[SudokuBoard alloc] init];
    self.boardView.board = sudokuBoard;
    [self loadNewGame:0];
}

//tags are set to
#define DELETE_BUTTON 10
#define PENCIL_BUTTON 11
#define NEWGAME_BUTTON 12

-(BOOL)inPencilMode{
    NSButtonCell *bcell = [self.buttonMatrix cellWithTag:PENCIL_BUTTON];
    return bcell.state == NSOnState;
}

- (IBAction)buttonMatrixClick:(id)sender {
    NSButtonCell *bcell = [sender selectedCell];
    NSLog(@"bcell tag = %d", (int) bcell.tag);
    
    if(1 <= bcell.tag && bcell.tag <= 9 && self.boardView.selectedRow >= 0 && self.boardView.selectedCol >= 0){
        if([self inPencilMode]){
            
        }else{
            [sudokuBoard setNumber:(int)bcell.tag AtRow:self.boardView.selectedRow Column:self.boardView.selectedCol];
            [self.boardView setNeedsDisplay:YES];
        }
    }else if(bcell.tag == NEWGAME_BUTTON){
        [NSApp beginSheet:self.optionWindow modalForWindow:self.mainWindow modalDelegate:nil didEndSelector:NULL contextInfo:NULL];
    }
}

- (IBAction)cancelOptionWindow:(id)sender {
    NSLog(@"cancelOptionWindow");
    [NSApp endSheet:self.optionWindow];
    [self.optionWindow orderOut:sender];
}

- (IBAction)newGame:(id)sender {
    [NSApp beginSheet:self.optionWindow modalForWindow:self.mainWindow modalDelegate:nil didEndSelector:NULL contextInfo:NULL];
}

#define EASY 0
#define SIMPLE 1
#define INTERMEDIATE 2
#define EXPERT 3

- (IBAction)newGameLevel:(id)sender {
    const int tag = (int)[sender tag];
    switch(tag){
        case EASY:
            [self loadNewGame:EASY];
            break;
        case SIMPLE:
            [self loadNewGame:SIMPLE];
            break;
        case INTERMEDIATE:
            [self loadNewGame:INTERMEDIATE];
            break;
        case EXPERT:
            [self loadNewGame:EXPERT];
            break;
    }
}
@end
