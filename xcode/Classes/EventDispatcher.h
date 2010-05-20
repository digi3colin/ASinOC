//
//  EventDispatcher.h
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IEventDispatcher.h"

@interface EventDispatcher:NSObject <IEventDispatcher>
{
	NSMutableDictionary *dictASFunctions;
	NSNotificationCenter *broadcaster;
	BOOL async;
}
-(id)initSync;
@end
