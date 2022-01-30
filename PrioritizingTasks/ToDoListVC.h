//
//  ToDoListVC.h
//  PrioritizingTasks
//
//  Created by abdrahman on 27/01/2022.
//

#import <UIKit/UIKit.h>
#import "myProtocol.h"
#import "UpdatedDataProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoListVC : UIViewController <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource, myProtocol, UpdatedDataProtocol>

@property UISearchController *searchController;
@property NSMutableArray *tasks;
@end

NS_ASSUME_NONNULL_END
