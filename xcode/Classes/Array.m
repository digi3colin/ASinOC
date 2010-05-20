//
//  Array.m
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import "Array.h"

@implementation Array

-(NSUInteger) length{
	return [base count];
}

-(id)initWithNSMutableArray:(NSMutableArray*)ary{
	if((self = [super init])){
		base = ary;
		[ary retain];
	}
	return self;	
}

- (id)init{
	if((self = [super init])){
		base = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void) dealloc{
//	[base removeAllObjects];
	[base release];
	[super dealloc];
}

-(NSInteger) indexOf:(id)_searchElement{
	return [self indexOf:_searchElement fromIndex:0];
}

-(NSInteger) indexOf:(id)_searchElement fromIndex:(NSInteger)_index{
	NSRange range = {_index, ([base count]-_index)};
	NSUInteger ret = [base indexOfObject:_searchElement inRange:range];
	if(ret == NSNotFound)return -1;
	return ret;
}

-(NSString*) join{
	return [self join:@","];
}

-(NSString*) join:(id)_sep{
	return [base componentsJoinedByString:_sep];
}

-(NSInteger) lastIndexOf:(id)_searchElement{
	return [self lastIndexOf:_searchElement fromIndex:[base count]];
}

-(NSInteger) lastIndexOf:(id)_searchElement fromIndex:(NSInteger)_index{
	//reverse Array
	NSArray *newArray = [[base reverseObjectEnumerator] allObjects];
	
	NSInteger start = [newArray count]-_index;

	NSRange range = {start, [newArray count]-start};
	NSUInteger ret = [newArray indexOfObject:_searchElement inRange:range];
	if(ret == NSNotFound)return -1;

	return [base count]-ret-1;
}

-(id) pop{
	id ret = [base lastObject];
	[base removeLastObject];
	return ret;
}

-(NSUInteger)push:(id)_object{
	[base addObject:_object];
	return [base count];
}

-(Array*) reverse{
	NSArray *newArray = [[base reverseObjectEnumerator] allObjects];
	[base removeAllObjects];
	[base addObjectsFromArray:newArray];
	return self;
}

-(id) shift{
	id ret = [base objectAtIndex:0];
	[base removeObjectAtIndex:0];
	return ret;
}

-(NSString*) toLocaleString{
	return [self toString];
}

-(NSString*) toString{
	return [NSString stringWithFormat:@"%@",base];
}

-(Array*) slice{
	return [self slice:0 endIndex:-1];
}

-(Array*) slice:(NSInteger)_startIndex{
	return [self slice:_startIndex endIndex:-1];
}

-(Array*) slice:(NSInteger)_startIndex endIndex:(NSInteger)_lastIndex{
	if(_lastIndex==-1){
		_lastIndex = [base count];
	}

	_lastIndex = MIN([base count], _lastIndex);

	NSRange range = {_startIndex,_lastIndex-_startIndex};
	NSMutableArray *resultSet = [NSMutableArray arrayWithArray:[base subarrayWithRange:range]];

	return [[[Array alloc] initWithNSMutableArray:resultSet] autorelease];
}

-(NSUInteger) unshift:(id)_object{
	[base insertObject:_object atIndex:0];
	return [base count];
}

-(BOOL) some:(ASFunction*)_callback thisObject:(id)_thisObject{
	NSLog(@"not implemented Array some");
	return YES;
}

-(Array*) sort:(id)_object ,...{
	NSLog(@"not implemented Array sort");
	return self;
}

-(Array*) sortOn:(id)fieldName options:(id)_options{
	NSLog(@"not implemented Array sort");
	return self;
}

-(Array*) splice:(NSInteger)startIndex deleteCount:(NSUInteger)_deleteCount, ...{
	NSLog(@"not implemented Array sort");
	return self;
}

-(Array*) concat:(id)_object ,...{
	NSLog(@"not implemented Array concat");
	return [[[Array alloc] init] autorelease];
}

-(BOOL) every:(ASFunction*)_callback thisObject:(id)_thisObject{
	NSLog(@"not implemented Array every");
	return YES;
}

-(Array*) filter:(ASFunction*)_callback thisObject:(id)_thisObject{
	NSLog(@"not implemented Array filter");
	return [[[Array alloc] init] autorelease];
}

-(void)	forEach:(ASFunction*)_callback thisObject:(id)_thisObject{
	NSLog(@"not implemented Array forEach");
}

-(Array*) map:(ASFunction*)_callback thisObject:(id)_thisObject{
	NSLog(@"not implemented Array map");
	return [[[Array alloc] init] autorelease];
}

@end
