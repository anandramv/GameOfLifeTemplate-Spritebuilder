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
    
    for(int i;i<GIRD_ROWS;i++){
        _gridArray[i]=[NSMutableArray array];
        x=0;
        
        for(int j;j<GIRD_COLUMNS;j++){
            Creature *creature=[[Creature alloc]init];
            creature.anchorPoint=ccp(0,0);
            creature.position=ccp(x,y);
            [self addChild:creature];
            
            
            _gridArray[i][j]=creature;
            creature.isAlive=YES;
            x+=_cellWidth;
        }
        y+=_cellHeight;
    }
    
}


@end
