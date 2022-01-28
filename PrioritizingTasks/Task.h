//
//  Task.h
//  PrioritizingTasks
//
//  Created by abdrahman on 27/01/2022.
//

#import <Foundation/Foundation.h>
#import "Priorities.h"

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject
@property NSString* name;
@property NSString* description;
@property enum Priorities preirity;
@property NSString* dateOfCreation;
@end



NS_ASSUME_NONNULL_END
