//
//  UpdatedDataProtocol.h
//  PrioritizingTasks
//
//  Created by abdrahman on 30/01/2022.
//

#ifndef UpdatedDataProtocol_h
#define UpdatedDataProtocol_h

#import <Foundation/Foundation.h>
#import "Task.h"

//NS_ASSUME_NONNULL_BEGIN

@protocol UpdatedDataProtocol <NSObject>

-(void) setUpdatedDataInMainTableData: (Task*) task;

@end

#endif /* UpdatedDataProtocol_h */
