//
//  EditVC.m
//  PrioritizingTasks
//
//  Created by abdrahman on 30/01/2022.
//

#import "EditVC.h"

@interface EditVC ()
@property (weak, nonatomic) IBOutlet UITextField *nameTxt;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTxt;
@property (weak, nonatomic) IBOutlet UITextField *priorityTxt;
@property (weak, nonatomic) IBOutlet UITextField *dateTxt;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation EditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [_nameTxt addTarget:self
                    action:@selector(textFieldDidChange)
          forControlEvents:UIControlEventEditingChanged];
    _saveBtn.enabled = false;
}

- (void)textFieldDidChange
{
    if ([self.nameTxt.text isEqualToString:@""]) {
        [self.saveBtn setEnabled:NO];
    }
    else {
        [self.saveBtn setEnabled:YES];
    }
}

- (IBAction)saveBtnPressed:(UIButton *)sender {
    [self.editedTask setTaskName:_nameTxt.text];
    [self.editedTask setTaskDescription:_descriptionTxt.text];
    [self.editedTask setTaskPreirity:_priorityTxt.text];
    [self.editedTask setTaskdateOfCreation:_dateTxt.text];
    [self.delegate updateNewData: _editedTask];
//
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

