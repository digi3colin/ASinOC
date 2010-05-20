//
//  Event.h
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject {
	id currentTarget;
	int eventPhase;
	id target;		

	BOOL bubbles;
	BOOL cancelable;
	NSString* type;
}

-(Event*) initWithType:(NSString*)_type;
-(Event*) initWithType:(NSString*)_type bubbles:(BOOL)_bubbles cancelable:(BOOL)_cancelable;

-(NSString*) toString;
@property (readonly) BOOL bubbles;
@property (readonly) BOOL cancelable;
@property (readonly) NSString *type;

@property (retain) id currentTarget;
@property (retain) id target;
@property (readonly) int eventPhase;
@end
