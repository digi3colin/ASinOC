//
//  ASMacro.h
//
//  Created by Colin Leung on 2010-05-19.
//  Copyright (c) 2010 digi3studio. All rights reserved.
//

#define as3delegate(o,m) [[[ASFunction alloc] initWithObject:o method:@selector(m)] autorelease]
#define as3new(c)[[c alloc] init]
#define as3newEvent(str)[[[Event alloc] initWithType:@str] autorelease]
#define this self
#define as3optionalParameterImp(lastParameter,lastParameterAction,optionalParameterAction)id currentObject;va_list argList;int objectCount = 1;if (lastParameter){lastParameterAction;objectCount++;va_start(argList, lastParameter);while ((currentObject = va_arg(argList, id))){optionalParameterAction;objectCount++;}va_end(argList);}