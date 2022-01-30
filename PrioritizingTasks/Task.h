//
//  Task.h
//  PrioritizingTasks
//
//  Created by abdrahman on 27/01/2022.
//

#import <Foundation/Foundation.h>
#import "Priorities.h"

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject<NSCoding>

//typedef enum Priorities{
//    high = 0,
//    med = 1,
//    low = 2
//
//}Priorities;
@property (strong,nonatomic)NSString* taskName;
@property (strong,nonatomic)NSString* taskDescription;
@property (strong,nonatomic)NSString* taskPreirity;
@property (strong,nonatomic)NSString* taskdateOfCreation;


@end



NS_ASSUME_NONNULL_END
