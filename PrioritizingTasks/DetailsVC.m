//
//  DetailsVC.m
//  PrioritizingTasks
//
//  Created by abdrahman on 27/01/2022.
//

#import "DetailsVC.h"

@interface DetailsVC ()
//@property (weak, nonatomic) IBOutlet UILabel *nameTxt;
//@property (weak, nonatomic) IBOutlet UILabel *descriptionTxt;
//@property (weak, nonatomic) IBOutlet UILabel *priorityTxt;
//@property (weak, nonatomic) IBOutlet UILabel *dateTxt;

@property (weak, nonatomic) IBOutlet UILabel *taskNameTxt;
@property (weak, nonatomic) IBOutlet UILabel *taskDescriptionTxt;
@property (weak, nonatomic) IBOutlet UILabel *taskPriorityTxt;
@property (weak, nonatomic) IBOutlet UILabel *taskdateTxt;

@end

@implementation DetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    _taskNameTxt.text = _taskObj.taskName;
    _taskDescriptionTxt.text = _taskObj.taskDescription;
//    _taskPriorityTxt.text = [@"Priority: " stringByAppendingFormat:@"%@", _taskObj.taskPreirity];
    NSString *priority = [self describePriorityType: _taskObj.taskPreirity];
    _taskPriorityTxt.text = [@"Priority: " stringByAppendingFormat:@"%@", priority];
    _taskdateTxt.text = _taskObj.taskdateOfCreation;
}


- (NSString*)describePriorityType:(Priorities)priorityType {
    switch(priorityType) {
        case high:
            return @"High";
        case med:
            return @"Med";
        case low:
            return @"Low";
    }
    [NSException raise:NSInvalidArgumentException format:@"The given format type number, %ld, is not known.", priorityType];
    return nil; // Keep the compiler happy - does not understand above line never returns!
}

@end
