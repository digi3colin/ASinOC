//
//  ASFunction.h
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ASFunction : NSObject {
	id obj;
	SEL method;
	id userData;
}
-(ASFunction*) initWithObject:(id)_obj method:(SEL)_method;
@property (readonly) id obj;
@property (readonly) SEL method;
@property (retain) id userData;
@end
