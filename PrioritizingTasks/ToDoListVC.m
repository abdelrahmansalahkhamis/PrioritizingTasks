//
//  ToDoListVC.m
//  PrioritizingTasks
//
//  Created by abdrahman on 27/01/2022.
//

#import "ToDoListVC.h"
#import "DetailsVC.h"
#import "AddNewVC.h"
#import "Task.h"
#import "Priorities.h"

@interface ToDoListVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;


@end

@implementation ToDoListVC

NSMutableArray *names;
NSMutableArray *descriptions;
NSMutableArray *titles;

NSMutableArray *mainArr;

NSMutableArray *highPriorityArr;
NSMutableArray *medPriorityArr;
NSMutableArray *lowPriorityArr;
NSMutableArray *filteredArr;

NSArray *filteredTitles = @[@"All", @"Name", @"Description", @"Prority", @"Progress"];

- (void)viewDidLoad {
    [super viewDidLoad];
    _tasks = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view.
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.navigationItem.titleView = self.searchController.searchBar;
    //self.definesPresentationContext = YES;
    
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.searchController.searchBar.delegate = self;
    //self.searchController.searchBar.scopeButtonTitles = [@"Friends", @"Everyone"];
    [self.searchController.searchBar setScopeButtonTitles: filteredTitles];
    [self.searchController.searchBar setScopeBarButtonTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], UITextAttributeTextColor, nil] forState:UIControlStateNormal];
    [self.searchController.searchBar setScopeBarButtonTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], UITextAttributeTextColor, nil] forState:UIControlStateSelected];
    //self.searchController.searchResultsUpdater = nil;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    [self configureToolBar];
    [self configeTableView];

    
    self.definesPresentationContext = YES;
    [self.searchController.searchBar sizeToFit];
    [self initTask];
}

-(void) initTask{
    Task *task1 = [Task new];
    task1.taskName = @"Objective c";
    task1.taskDescription = @"Interesting Language";
    task1.taskPreirity = (Priorities)high;
    task1.taskdateOfCreation = @"January 26, 2022";
    
    Task *task2 = [Task new];
    task2.taskName = @"Swift";
    task2.taskDescription = @"Interesting Language";
    task2.taskPreirity = (Priorities)med;
    task2.taskdateOfCreation = @"January 26, 2022";
    
    Task *task3 = [Task new];
    task3.taskName = @"C++";
    task3.taskDescription = @"Interesting Language";
    task3.taskPreirity = (Priorities)high;
    task3.taskdateOfCreation = @"January 26, 2022";
    
    Task *task4 = [Task new];
    task4.taskName = @"Java";
    task4.taskDescription = @"Interesting Language";
    task4.taskPreirity = (Priorities)low;
    task4.taskdateOfCreation = @"January 26, 2022";
    
    Task *task5 = [Task new];
    task5.taskName = @"PHP";
    task5.taskDescription = @"Interesting Language";
    task5.taskPreirity = (Priorities)high;
    task5.taskdateOfCreation = @"January 26, 2022";
    
    Task *task6 = [Task new];
    task6.taskName = @"Paython";
    task6.taskDescription = @"Interesting Language";
    task6.taskPreirity = (Priorities)med;
    task6.taskdateOfCreation = @"January 26, 2022";
    
    [_tasks addObject:task1];
    [_tasks addObject:task2];
    [_tasks addObject:task3];
    [_tasks addObject:task4];
    [_tasks addObject:task5];
    [_tasks addObject:task6];
    
}



-(void) configeTableView{
    mainArr = [NSMutableArray new];
    highPriorityArr = [NSMutableArray new];
    medPriorityArr = [NSMutableArray new];
    lowPriorityArr = [NSMutableArray new];
    //filteredArr = [NSMutableArray new];
    //names = [[NSMutableArray alloc] initWithObjects:@"Mohamed", @"Ahmed", @"Ali","Mohamed", @"Ahmed", @"Ali", "Mohamed", @"Ahmed", @"Ali", nil];
    names = [NSMutableArray arrayWithObjects:@"Mohamed", @"Ahmed", @"Ali", nil];
    titles = [NSMutableArray arrayWithObjects:@"Toyota", @"Nissan", @"Jeep", @"GMC", @"Dodge", @"Audi", @"Suzuki", @"Isuzo", @"Kia", @"Honda", @"Hyondai",nil];
    descriptions = [[NSMutableArray alloc] initWithObjects:@"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234",@"1234", nil];
//    for(Task *task in _tasks){
//        NSLog(@"%@, \n",task);
//        switch (task.taskPreirity) {
//            case high:
//                [highPriorityArr addObject:task];
//                continue;
//            case med:
//                [medPriorityArr addObject:task];
//                continue;
//            case low:
//                [lowPriorityArr addObject:task];
//                continue;
//            default:
//                break;
//        }
//    }
    //mainArr = _tasks;
}

-(void) configureToolBar{
    
    UIButton *button1 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage systemImageNamed:@"pencil.circle"] forState:UIControlStateNormal];
    //button1.imageView.contentMode = UIViewContentModeScaleToFill;
    [button1 setTintColor: [UIColor blackColor]];
    [button1 setTag:1];
    [button1 addTarget:self action:@selector(toolBtnTapped:)forControlEvents:UIControlEventTouchUpInside];
    [button1 setFrame:CGRectMake(0, 0, 53, 31)];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(3, 30, 50, 20)];
    [label1 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    [label1 setText:@"To Do"];
    label1.textAlignment = UITextAlignmentCenter;
    [label1 setTextColor:[UIColor blackColor]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [button1 addSubview:label1];
    UIBarButtonItem *namesBtn = [[UIBarButtonItem alloc] initWithCustomView:button1];
    
    UIButton *button2 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage systemImageNamed:@"rectangle.and.pencil.and.ellipsis"] forState:UIControlStateNormal];
    [button2 setTintColor: [UIColor blackColor]];
    [button2 setTag:2];
    [button2 addTarget:self action:@selector(toolBtnTapped:)forControlEvents:UIControlEventTouchUpInside];
    [button2 setFrame:CGRectMake(0, 0, 53, 31)];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(-7, 30, 70, 20)];
    [label2 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    [label2 setText:@"Progress"];
    label2.textAlignment = UITextAlignmentCenter;
    [label2 setTextColor:[UIColor blackColor]];
    [label2 setBackgroundColor:[UIColor clearColor]];
    [button2 addSubview:label2];
    UIBarButtonItem *titlesBtn = [[UIBarButtonItem alloc] initWithCustomView:button2];
    
    UIButton *button3 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setImage:[UIImage systemImageNamed:@"checkmark.rectangle"] forState:UIControlStateNormal];
    [button3 setTintColor: [UIColor blackColor]];
    [button3 setTag:3];
    [button3 addTarget:self action:@selector(toolBtnTapped:)forControlEvents:UIControlEventTouchUpInside];
    [button3 setFrame:CGRectMake(0, 0, 53, 31)];
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(3, 30, 50, 20)];
    [label3 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    [label3 setText:@"Done"];
    label3.textAlignment = UITextAlignmentCenter;
    //[label3 setTextColor:[UIColor blackColor]];
    [label3 setBackgroundColor:[UIColor clearColor]];
    [button3 addSubview:label3];
    UIBarButtonItem *descriptionsBtn = [[UIBarButtonItem alloc] initWithCustomView:button3];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    [_toolBar setItems:[NSArray arrayWithObjects: flexibleSpace, namesBtn, flexibleSpace, titlesBtn, flexibleSpace, descriptionsBtn, flexibleSpace, nil]];

}
-(void) toolBtnTapped:(id)sender {
    switch ([sender tag]) {
        case 1:
            //[sender setTintColor:[UIColor magentaColor]];
            mainArr = _tasks;
            break;
        case 2:
            //[sender setTintColor:[UIColor magentaColor]];
            mainArr = titles;
            break;
        case 3:
            //[sender setTintColor:[UIColor magentaColor]];
            mainArr = descriptions;
            break;
        default:
            break;
    }
    [self.tableView reloadData];
}

- (IBAction)addNewPressed:(UIBarButtonItem *)sender {
    AddNewVC *addNew = [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewVC"];
    addNew.delegate = self;
    [self.navigationController pushViewController:addNew animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //[searchBar resignFirstResponder];
    printf("searchBarSearchButtonClicked\n");
}

- (void)presentSearchController:(UISearchController *)searchController {
    printf("presentSearchController\n");
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    // do something before the search controller is presented
    printf("willPresentSearchController\n");
    [self updateSearchResultsForSearchController:self.searchController];
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    // do something after the search controller is presented
    printf("didPresentSearchController\n");
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    // do something before the search controller is dismissed
    printf("willDismissSearchController\n");
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    // do something after the search controller is dismissed
    printf("didDismissSearchController\n");
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"updateSearchResultsForSearchController");
    NSString *searchString = [self.searchController.searchBar text];
    //NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    NSPredicate *predicate   = [NSPredicate predicateWithFormat:@"SELF.taskName contains [c] %@", searchString];
            //attributeName, attributeValue];
    // "SELF[%@] CONTAINS %@"
    if (filteredArr != nil) {
        [filteredArr removeAllObjects];
    }
    //过滤数据
    filteredArr = [NSMutableArray arrayWithArray:[mainArr filteredArrayUsingPredicate:predicate]];
    //刷新表格
    [self.tableView reloadData];
    
}
-(void) searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger) selectedScope {

    //filterArrayWithCharacterLength(selectedScope);
//    printf("selectedScopeButtonIndexDidChange: %d\n",selectedScope);
//    switch (selectedScope) {
//        case 0:
//            mainArr = names;
//            break;
//        case 1:
//            mainArr = titles;
//            break;
//        case 2:
//            mainArr = descriptions;
//            break;
//        default:
//            break;
//    }
    [self updateSearchResultsForSearchController:self.searchController];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(self.searchController.active){
        return 1;
    }else{
        return 3;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.searchController.active){
        return [filteredArr count];
    }else{
        //return [mainArr count];
        switch (section) {
            case 0:
                return [highPriorityArr count];
                break;
            case 1:
                return [medPriorityArr count];
                break;
            case 2:
                return [lowPriorityArr count];
                break;
            default:
                return [highPriorityArr count];
                break;
        }
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(_searchController.isActive){
        return nil;
    }
    switch (section) {
        case 0:
            return @"High Priority";
            break;
        case 1:
            return @"Med Priority";
            break;
        case 2:
            return @"Low Priority";
            break;
        default:
            return @"High Priority";
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    //cell.textLabel.text = @"text";
    UILabel *nameLbl =  [cell viewWithTag:5];
    NSString *name;
    
    UILabel *descriptionLbl =  [cell viewWithTag:6];
    NSString *description;
    
    UILabel *priorityLbl =  [cell viewWithTag:7];
    NSString *priority;
    
    UILabel *dateLbl =  [cell viewWithTag:8];
    NSString *date;
    if(self.searchController.active){
        //cell.textLabel.text = [filteredArr[indexPath.row] taskName];
        
        name = [filteredArr[indexPath.row] taskName];
        
        description = [filteredArr[indexPath.row] taskDescription];
        
        priority = [self describePriorityType: [filteredArr[indexPath.row] taskPreirity]];
        
        date = [filteredArr[indexPath.row] taskdateOfCreation];
        
    }else{
        switch (indexPath.section) {
            case 0:
                name = [highPriorityArr[indexPath.row] taskName];
                
                description = [highPriorityArr[indexPath.row] taskDescription];
                
                priority = [self describePriorityType: [highPriorityArr[indexPath.row] taskPreirity]];
                
                date = [highPriorityArr[indexPath.row] taskdateOfCreation];
                break;
            case 1:
                name = [medPriorityArr[indexPath.row] taskName];
                
                description = [medPriorityArr[indexPath.row] taskDescription];
                
                priority = [self describePriorityType: [medPriorityArr[indexPath.row] taskPreirity]];
                
                date = [medPriorityArr[indexPath.row] taskdateOfCreation];
                break;
            case 2:
                name = [lowPriorityArr[indexPath.row] taskName];
                
                description = [lowPriorityArr[indexPath.row] taskDescription];
                
                priority = [self describePriorityType: [lowPriorityArr[indexPath.row] taskPreirity]];
                
                date = [lowPriorityArr[indexPath.row] taskdateOfCreation];
                break;
            default:
                break;
        }
    }
    nameLbl.text = name;
    descriptionLbl.text = description;
    priorityLbl.text = [@"Priority: " stringByAppendingFormat:@"%@", priority];
    dateLbl.text = date;
    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailsVC *details = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsVC"];
    [details setDelegate:self];
    switch (indexPath.section) {
        case 0:
            [details setTaskObj: highPriorityArr[indexPath.row]];
            break;
        case 1:
            [details setTaskObj: medPriorityArr[indexPath.row]];
            break;
        case 2:
            [details setTaskObj: lowPriorityArr[indexPath.row]];
            break;
        default:
            break;
    }
    //[details setTaskObj: mainArr[indexPath.row]];
    [self.navigationController pushViewController:details animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
//    UILabel *titleLbl = [UILabel new];
//    titleLbl.text =
//    UIView *view = [UIView new];
//    view.backgroundColor = [UIColor yellowColor];
//    return view;
    if(_searchController.isActive){
        return nil;
    }
    static NSString *identifier = @"defaultHeader";
        UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
        if (!headerView) {
            headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:identifier];
        }
        headerView.textLabel.text = @"some title";
    headerView.contentView.backgroundColor = [UIColor orangeColor];
        return headerView;
}

-(void) setNewData: (Task*) task{
    switch (task.taskPreirity) {
        case high:
            [highPriorityArr addObject:task];
            break;
        case 1:
            [medPriorityArr addObject:task];
            break;
        case 2:
            [lowPriorityArr addObject:task];
            break;
        default:
            break;
    }
    [mainArr addObject:task];
    [self.tableView reloadData];
}
@end
