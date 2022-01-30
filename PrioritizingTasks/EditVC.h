//
//  EditVC.h
//  PrioritizingTasks
//
//  Created by abdrahman on 30/01/2022.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "EditProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditVC : UIViewController{}
    @property Task *editedTask;
    @property id<EditProtocol> delegate;

@end




NS_ASSUME_NONNULL_END
