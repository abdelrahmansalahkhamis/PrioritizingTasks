//
//  AddNewVC.m
//  PrioritizingTasks
//
//  Created by abdrahman on 27/01/2022.
//

#import "AddNewVC.h"
#import "Priorities.h"
#import "Task.h"

@interface AddNewVC ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *addNewBtn;

@end

@implementation AddNewVC

Task *task;
//Priorities cases;
NSArray *elements;
NSInteger selectedPriority;
NSString *dateString;
NSMutableArray *arrayToSave;
- (void)viewDidLoad {
    [super viewDidLoad];
    task = [Task new];
    elements = [[NSArray alloc] initWithObjects: @"High", @"Mediam", @"Low", nil];
    //elements = [[NSArray alloc] initWithObjects: (Priorities)high, (Priorities)med, (Priorities)low, nil];
    
    _pickerView.delegate = self; // Also, can be done from IB, if you're using
    _pickerView.dataSource = self;
    _nameTextField.delegate = self;
    [_nameTextField addTarget:self
                    action:@selector(textFieldDidChange)
          forControlEvents:UIControlEventEditingChanged];
    _addNewBtn.enabled = false;
}

- (void)textFieldDidChange
{
    if ([self.nameTextField.text isEqualToString:@""]) {
        [self.addNewBtn setEnabled:NO];
    }
    else {
        [self.addNewBtn setEnabled:YES];
    }
}
- (IBAction)datePickerChangedValue:(UIDatePicker *)sender {
//    NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];

        //self.myLabel.text = [dateFormatter stringFromDate:[dueDatePickerView date]];
    dateString = [dateFormatter stringFromDate:[sender date]];
        NSLog(@"Picked the date %@", [dateFormatter stringFromDate:[sender date]]);
    //NSLog(@"Picked the date %@",sender.date);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
     return 1;  // Or return whatever as you intend
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
     return [elements count];//Or, return as suitable for you...normally we use array for dynamic
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectedPriority = row;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component {
     //return [NSString stringWithFormat:@"Choice-%d",row];//Or, your suitable title; like Choice-a, etc.
//    switch (row) {
//        case 0:
//            return @"High";
//            break;
//        case 1:
//            return @"Mediam";
//            break;
//        case 2:
//            return @"Low";
//            break;
//        default:
//            return @"High";
//    }
    //return [self describePriorityType: elements[row]];
    return  elements[row];
}



- (IBAction)addNewPressed:(UIButton *)sender {
    
    [task setTaskName:_nameTextField.text];
    [task setTaskDescription:_descriptionTextField.text];
    switch (selectedPriority) {
        case 0:
            //[task setTaskPreirity:(Priorities)high];
            [task setTaskPreirity:@"High"];
            break;
        case 1:
            //[task setTaskPreirity:(Priorities)med];
            [task setTaskPreirity:@"Med"];
            break;
        case 2:
            //[task setTaskPreirity:(Priorities)low];
            [task setTaskPreirity:@"Low"];
            break;
        default:
            
            //[task setTaskPreirity: (Priorities)high];
            break;
    }
    [task setTaskdateOfCreation: dateString];
    [_delegate setNewData: task];
    [self saveCustomObject:task];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)saveCustomObject:(Task *)task
{
    NSData *taskData = [NSKeyedArchiver archivedDataWithRootObject:task];
    [[NSUserDefaults standardUserDefaults] setObject:taskData forKey:@"tasks"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    printf("saved!!!!!!!\n");
}
@end
