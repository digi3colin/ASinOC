//
//  ASFunction.m
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import "ASFunction.h"


@implementation ASFunction
@synthesize obj;
@synthesize method;
@synthesize userData;
- (ASFunction*) initWithObject:(id)_obj method:(SEL)_method
{
	if((self = [super init]))
	{
		obj = _obj;
		method = _method;
	}
	return self;
}
@end
