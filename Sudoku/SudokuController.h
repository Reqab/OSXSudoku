//
//  SudokuController.h
//  Sudoku
//
//  Created by David Parrott on 4/11/13.
//  Copyright (c) 2013 WSUV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoardView.h"

@interface SudokuController : NSObject
@property (weak) IBOutlet BoardView *boardView;
@property (weak) IBOutlet NSMatrix *buttonMatrix;
- (IBAction)buttonMatrixClick:(id)sender;

@end
