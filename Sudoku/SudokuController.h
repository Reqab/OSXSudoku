//
//  SudokuController.h
//  Sudoku
//
//  Created by David Parrott on 4/11/13.
//  Copyright (c) 2013 WSUV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SudokuBoardView.h"

@interface SudokuController : NSObject
@property (weak) IBOutlet SudokuBoardView *boardView;
@property (weak) IBOutlet NSMatrix *buttonMatrix;
- (IBAction)buttonMatrixClick:(id)sender;
@property (unsafe_unretained) IBOutlet NSWindow *mainWindow;
@property (unsafe_unretained) IBOutlet NSWindow *optionWindow;
- (IBAction)cancelOptionWindow:(id)sender;
- (IBAction)newGame:(id)sender;
- (IBAction)newGameLevel:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)clearConflicts:(id)sender;

@end
