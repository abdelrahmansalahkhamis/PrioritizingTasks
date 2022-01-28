//
//  ToDoListVC.m
//  PrioritizingTasks
//
//  Created by abdrahman on 27/01/2022.
//

#import "ToDoListVC.h"
#import "DetailsVC.h"
#import "AddNewVC.h"

@interface ToDoListVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;


@end

@implementation ToDoListVC

NSMutableArray *names;
NSMutableArray *descriptions;
NSMutableArray *titles;

NSMutableArray *mainArr;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.navigationItem.titleView = self.searchController.searchBar;
    //self.definesPresentationContext = YES;
    
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.searchController.searchBar.delegate = self;
    //self.searchController.searchResultsUpdater = nil;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    [self configureToolBar];
    [self configeTableView];
}

-(void) configeTableView{
    mainArr = [NSMutableArray new];
    //names = [[NSMutableArray alloc] initWithObjects:@"Mohamed", @"Ahmed", @"Ali","Mohamed", @"Ahmed", @"Ali", "Mohamed", @"Ahmed", @"Ali", nil];
    names = [NSMutableArray arrayWithObjects:@"Mohamed", @"Ahmed", @"Ali", nil];
    titles = [NSMutableArray arrayWithObjects:@"titles", @"titles", @"titles", @"titles", @"titles", @"titles", @"titles", @"titles", @"titles",nil];
    descriptions = [NSMutableArray arrayWithObjects:@"descriptions", @"descriptions", @"descriptions", @"descriptions", @"descriptions", @"descriptions",nil];
//    titles = [NSMutableArray arrayWithObjects:@"Mercedes", @"Toyota", @"Nissan", "Jeep", @"GMC", @"Dodge","Audi", @"Suzuki", @"Isuzo","Kia", @"Honda", @"Hyondai",nil];
    
    //descriptions = [[NSMutableArray alloc] initWithObjects:@"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234", @"1234",@"1234", nil];
    mainArr = names;
}

-(void) configureToolBar{
    
    UIButton *button1 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage systemImageNamed:@"folder.fill"] forState:UIControlStateNormal];
    [button1 setTintColor: [UIColor blackColor]];
    [button1 addTarget:self action:@selector(namesBtnTapped:)forControlEvents:UIControlEventTouchUpInside];
    [button1 setFrame:CGRectMake(0, 0, 53, 31)];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(3, 30, 50, 20)];
    [label1 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    [label1 setText:@"name"];
    label1.textAlignment = UITextAlignmentCenter;
    [label1 setTextColor:[UIColor blackColor]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [button1 addSubview:label1];
    UIBarButtonItem *namesBtn = [[UIBarButtonItem alloc] initWithCustomView:button1];
    
    UIButton *button2 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage systemImageNamed:@"trash.fill"] forState:UIControlStateNormal];
    [button2 setTintColor: [UIColor blackColor]];
    [button2 addTarget:self action:@selector(titlesBtnTapped:)forControlEvents:UIControlEventTouchUpInside];
    [button2 setFrame:CGRectMake(0, 0, 53, 31)];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(3, 30, 50, 20)];
    [label2 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    [label2 setText:@"name"];
    label2.textAlignment = UITextAlignmentCenter;
    [label2 setTextColor:[UIColor blackColor]];
    [label2 setBackgroundColor:[UIColor clearColor]];
    [button2 addSubview:label2];
    UIBarButtonItem *titlesBtn = [[UIBarButtonItem alloc] initWithCustomView:button2];
    
    UIButton *button3 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setImage:[UIImage systemImageNamed:@"cloud.snow.fill"] forState:UIControlStateNormal];
    [button3 setTintColor: [UIColor blackColor]];
    [button3 addTarget:self action:@selector(descriptionsBtnTapped:)forControlEvents:UIControlEventTouchUpInside];
    [button3 setFrame:CGRectMake(0, 0, 53, 31)];
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(3, 30, 50, 20)];
    [label3 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    [label3 setText:@"name"];
    label3.textAlignment = UITextAlignmentCenter;
    [label3 setTextColor:[UIColor blackColor]];
    [label3 setBackgroundColor:[UIColor clearColor]];
    [button3 addSubview:label3];
    UIBarButtonItem *descriptionsBtn = [[UIBarButtonItem alloc] initWithCustomView:button3];

//    UIBarButtonItem *namesBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"folder.fill"] style:nil target:self action:@selector(namesBtnTapped:)];
//
//    UIBarButtonItem *titlesBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"trash.fill"] style:nil target:self action:@selector(titlesBtnTapped:)];
//
//    UIBarButtonItem *descriptionsBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage
//                                                                               systemImageNamed:@"cloud.snow.fill"] style:nil target:self action:@selector(descriptionsBtnTapped:)];
   
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    [_toolBar setItems:[NSArray arrayWithObjects: flexibleSpace, namesBtn, flexibleSpace, titlesBtn, flexibleSpace, descriptionsBtn, flexibleSpace, nil]];

}
-(void) namesBtnTapped:(id)sender {
    mainArr = names;
    [self.tableView reloadData];
}
-(void) titlesBtnTapped:(id)sender {
    mainArr = titles;
    [self.tableView reloadData];
}


-(void) descriptionsBtnTapped:(id)sender {
    mainArr = descriptions;
    [self.tableView reloadData];
}


- (IBAction)addNewPressed:(UIBarButtonItem *)sender {
    AddNewVC *addNew = [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewVC"];
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
    printf("updateSearchResultsForSearchController\n");
//     update the filtered array based on the search text
//    NSString *searchText = searchController.searchBar.text;
//
//    id <NSFetchedResultsSectionInfo> sectionInfo = [_fetchedResultsController.sections objectAtIndex:0];
//
//    if (searchText == nil) {
//
//        // If empty the search results are the same as the original data
//        self.searchResults = [sectionInfo.objects mutableCopy];
//
//    } else {
//
//        NSMutableArray *searchResults = [[NSMutableArray alloc] init];
//
//        NSArray *allObjects = sectionInfo.objects;
//
//        for (PhoneNumber *phoneMO in allObjects) {
//
//            if ([phoneMO.number containsString:searchText] || [[phoneMO.closrr_id filteredId] containsString:searchText] || [[phoneMO.contact.fullname lowercaseString] containsString:[searchText lowercaseString]]) {
//                [searchResults addObject:phoneMO];
//            }
//        }
//
//        self.searchResults = searchResults;
//
//    }
//
//    // hand over the filtered results to our search results table
//    CLCustomerResultrowsItemsCellController *tableController = (CLCustomerResultrowsItemsCellController *)self.searchController.searchResultsController;
//    tableController.filteredContacts = self.searchResults;
//    [tableController.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [mainArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //cell.textLabel.text = @"text";
    cell.textLabel.text = mainArr[indexPath.row];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailsVC *details = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsVC"];
    [self.navigationController pushViewController:details animated:YES];
}

@end
