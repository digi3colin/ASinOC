//
//  IFASTEventDispatcher.h
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IEventDispatcher.h"

@protocol IFASTEventDispatcher <IEventDispatcher>
-(id) when:(NSString*)_type observer:(id)_observer do:(SEL)_action;
@end