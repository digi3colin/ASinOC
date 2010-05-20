//
//  Array.h
//  ObjCAS
//
//  Created by Colin Leung on 19/05/2010.
//  Copyright 2010 Digi3 Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASFunction.h"

@interface Array : NSObject
{
	NSMutableArray* base;
}


-(id)         initWithNSMutableArray:(NSMutableArray*)ary;
-(NSUInteger) length;

-(Array*)     concat:(id)_object ,...;
-(BOOL)       every:(ASFunction*)_callback   thisObject:(id)_thisObject;
-(Array*)     filter:(ASFunction*)_callback  thisObject:(id)_thisObject;
-(void)	      forEach:(ASFunction*)_callback thisObject:(id)_thisObject;
-(NSInteger)  indexOf:(id)_searchElement     fromIndex:(NSInteger)_index;
-(NSString*)  join;
-(NSString*)  join:(id)_sep;
-(NSInteger)  indexOf:(id)_searchElement;
-(NSInteger)  lastIndexOf:(id)_searchElement;
-(NSInteger)  lastIndexOf:(id)_searchElement fromIndex:(NSInteger)_index;
-(Array*)     map:(ASFunction*)_callback     thisObject:(id)_thisObject;
-(id)         pop;
-(NSUInteger) push:(id)_object;
-(Array*)     reverse;
-(id)         shift;
-(Array*)     slice;
-(Array*)     slice:(NSInteger)_startIndex;
-(Array*)     slice:(NSInteger)_startIndex   endIndex:(NSInteger)_lastIndex;
-(BOOL)       some:(ASFunction*)_callback    thisObject:(id)_thisObject;
-(Array*)     sort:(id)_object ,...;
-(Array*)     sortOn:(id)fieldName          options:(id)_options;
-(Array*)     splice:(NSInteger)startIndex deleteCount:(NSUInteger)_deleteCount, ...;
-(NSString*)  toLocaleString;
-(NSString*)  toString;
-(NSUInteger) unshift:(id)_object;
@end
