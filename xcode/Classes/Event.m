//
//  Event.m
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import "Event.h"


@implementation Event

@synthesize bubbles;
@synthesize cancelable;
@synthesize currentTarget;
@synthesize eventPhase;
@synthesize target;
@synthesize type;

- (Event*)initWithType:(NSString*)_type{
	return [self initWithType:_type bubbles:NO cancelable:NO];
}

-(Event*) initWithType:(NSString*)_type bubbles:(BOOL)_bubbles cancelable:(BOOL)_cancelable{
	if((self = [super init])){
		type = _type;
		bubbles = _bubbles;
		cancelable = _cancelable;
		eventPhase = 2;
	}
	return self;	
}

- (NSString*) toString{
	return [[[NSString alloc] initWithFormat:@"[Event type='%@' bubbles=%i cancelable=%i eventPhase=%i]", type, bubbles, cancelable, eventPhase] autorelease];
}

-(void)dealloc{
	[currentTarget release];
	[target release];
	[super dealloc];
}
@end
