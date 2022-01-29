//
//  DetailsVC.h
//  PrioritizingTasks
//
//  Created by abdrahman on 27/01/2022.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "myProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsVC : UIViewController
@property Task* taskObj;
@property id<myProtocol> delegate;
@end

NS_ASSUME_NONNULL_END
