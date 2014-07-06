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
    
    [super onEnter];
    [self setupGrid];
    
    self.userInteractionEnabled=YES;
}

-(void)setupGrid{
    _cellHeight=self.contentSize.height/GIRD_ROWS;
    _cellWidth=self.contentSize.width/GIRD_COLUMNS;
    
    float x=0,y=0;
    
    _gridArray=[NSMutableArray array];
    
    for(int i=0;i<GIRD_ROWS;i++){
        _gridArray[i]=[NSMutableArray array];
        x=0;
        
        for(int j=0;j<GIRD_COLUMNS;j++){
            Creature *creature=[[Creature alloc]initCreature];
            creature.anchorPoint=ccp(0,0);
            creature.position=ccp(x,y);
            [self addChild:creature];
            
            
            _gridArray[i][j]=creature;
            x+=_cellWidth;
        }
        y+=_cellHeight;
    }
    
}


- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchlocation=[touch locationInNode:self];
    Creature* creature=[self creatureForTouchPosition:touchlocation];
    creature.isAlive=!creature.isAlive;
}

- (Creature *)creatureForTouchPosition:(CGPoint)touchPosition
{
    //get the row and column that was touched, return the Creature inside the corresponding cell
    int row=touchPosition.y/self.contentSize.height;
    int column=touchPosition.x/self.contentSize.width;
    
    return _gridArray[row][column];
    
}
@end
