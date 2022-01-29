//
//  myProtocol.h
//  PrioritizingTasks
//
//  Created by abdrahman on 29/01/2022.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@protocol myProtocol <NSObject>

-(void) setNewData: (Task*) task;

@end

NS_ASSUME_NONNULL_END
