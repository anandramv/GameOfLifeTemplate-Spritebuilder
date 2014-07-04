//
//  Grid.m
//  GameOfLife
//
//  Created by Anandram Venkataswamy on 03/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

// these are variable that can't be changed.
static const int GIRD_ROWS=8;
static const int GIRD_COLUMNS=10;

@implementation Grid

NSMutableArray *_gridArray;
float _cellWidth;
float _cellHeight;

- (void)onEnter{
    
    [self onEnter];
    [self setupGrid];
    
    self.userInteractionEnabled=YES;
}

-(void)setupGrid{
    _cellHeight=self.contentSize.height/GIRD_COLUMNS;
    _cellWidth=self.contentSize.width/GIRD_ROWS;
}


@end
