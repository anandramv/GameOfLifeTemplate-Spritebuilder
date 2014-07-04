//
//  Creature.h
//  GameOfLife
//
//  Created by Anandram Venkataswamy on 03/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Creature : CCSprite

//State of the creature
@property(nonatomic,assign) BOOL isAlive;

//Amount of living Neighbours
@property(nonatomic,assign) NSInteger* livingNeighbours;

-(id) initCreature;

@end
