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

typedef enum Priorities: NSInteger{
    high, med, low
    
}Priorities;
@property NSString* taskName;
@property NSString* taskDescription;
@property Priorities taskPreirity;
@property NSString* taskdateOfCreation;


@end



NS_ASSUME_NONNULL_END
