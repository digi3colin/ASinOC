//
//  IEventDispatcher.h
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "ASFunction.h"

@protocol IEventDispatcher
-(void)addEventListener:(NSString*)_type listener:(ASFunction*)_listener;
-(void)addEventListener:(NSString*)_type listener:(ASFunction*)_listener useCapture:(BOOL)_useCapture priority:(int)_priority useWeakReference:(BOOL)_useWeakReference;
-(BOOL)dispatchEvent:(Event*)event;
-(BOOL)hasEventListener:(NSString*)_type;
-(void)removeEventListener:(NSString*)_type listener:(ASFunction*)_listener;
-(void)removeEventListener:(NSString*)_type listener:(ASFunction*)_listener useCapture:(BOOL)_useCapture;
-(BOOL)willTrigger:(NSString*)_type;
@end