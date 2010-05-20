//
//  EventDispatcher.m
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import "EventDispatcher.h"

@implementation EventDispatcher
//dictionary to hold all ASFunction
- (id)init{
	if((self = [super init])){
		dictASFunctions = [[NSMutableDictionary alloc] init];//release in dealloc
		broadcaster = [NSNotificationCenter defaultCenter];//release in dealloc
		async = YES;
	}
	return self;
}

-(id)initSync{
	[self init];
	async = NO;
	return self;
}

-(void)addEventListener:(NSString*)_type listener:(ASFunction*)_listener{
	[self addEventListener:_type listener:_listener useCapture:NO priority:0 useWeakReference:NO];
}

-(void)addEventListener:(NSString*)_type listener:(ASFunction*)_listener useCapture:(BOOL)_useCapture priority:(int)_priority useWeakReference:(BOOL)_useWeakReference{	
	//run once
	if([dictASFunctions objectForKey:_type]==nil){
		[dictASFunctions setObject:[[NSMutableArray alloc]init] forKey:_type]; //release in dealloc
		[broadcaster addObserver:self selector:@selector(resolveNotification:) name:_type object:self];
	}

	//remove exist listener
	[self removeEventListener:_type listener:_listener useCapture:_useCapture];

	//if listener not exists, add to functions Array
	_listener.userData = [NSString stringWithFormat:@"%i",_useCapture];//release in dealloc | removeEventListener
	[[dictASFunctions objectForKey:_type] addObject:_listener];//release in dealloc | removeEventListener, dictASFunctions removeAllObject
}

-(BOOL)dispatchEvent:(Event*)_event{
	//no listener
	if([dictASFunctions objectForKey:_event.type]==nil)return NO;

	_event.target = self;
	_event.currentTarget = self;
	
	//event will release when userInfo dealloc
	NSDictionary* userInfo = [[[NSDictionary alloc]initWithObjectsAndKeys:_event,_event.type,nil] autorelease];

	NSNotification *myNotification = [NSNotification notificationWithName:_event.type object:self userInfo:userInfo];//self release in pool;
	if(async == YES){
		[[NSNotificationQueue defaultQueue] enqueueNotification:myNotification postingStyle:NSPostASAP coalesceMask:NSNotificationCoalescingOnName | NSNotificationCoalescingOnSender forModes:nil];
	}else{
		[[NSNotificationQueue defaultQueue] enqueueNotification:myNotification postingStyle:NSPostNow coalesceMask:NSNotificationNoCoalescing forModes:nil];
	}
	return YES;
}

-(void)resolveNotification:(NSNotification*)_notification{
	NSDictionary* userInfo = [_notification userInfo];
	Event* event = [userInfo objectForKey:[_notification name]];
	NSMutableArray *asFunctions = [dictASFunctions objectForKey:event.type];

	//loop all function 
	for(ASFunction *fnt in asFunctions){
		[fnt.obj performSelector:fnt.method withObject:event];
	}
}

-(BOOL)hasEventListener:(NSString*)_type{
	return ([dictASFunctions objectForKey:_type]==nil)?NO:YES;
}

-(BOOL)willTrigger:(NSString*)_type{
	return [self hasEventListener:_type];
}

-(void)removeEventListener:(NSString*)_type listener:(ASFunction*)_listener{
	[self removeEventListener:_type listener:_listener useCapture:NO];
}

-(void)removeEventListener:(NSString*)_type listener:(ASFunction*)_listener useCapture:(BOOL)_useCapture{
	NSMutableArray *asFunctions = [dictASFunctions objectForKey:_type];

	if([asFunctions count]==0)return;

	for(ASFunction *fnt in asFunctions){
		if((fnt.obj == _listener.obj)&&(fnt.method == _listener.method)&&(fnt.userData == [NSString stringWithFormat:@"%i",_useCapture])){
			[asFunctions removeObject:fnt];
			break;
		}
	}

	if([asFunctions count]==0){
		[dictASFunctions removeObjectForKey:_type];
		[asFunctions release];
		[broadcaster removeObserver:self name:_type object:self];
	};
}

-(void)dealloc{
	NSMutableArray *asFunctions;
	//loop dictASFunctions to remove all Array and all ASFunction listeners
	for (id key in dictASFunctions) {
		asFunctions = [dictASFunctions objectForKey:key];
		[asFunctions removeAllObjects];
		[asFunctions release];
	}

	[dictASFunctions removeAllObjects];
	[dictASFunctions release];

	[broadcaster removeObserver:self];
	[super dealloc];
}
@end