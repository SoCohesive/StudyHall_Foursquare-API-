//
//  StudyHallTipsDetailViewController.m
//  StudyHall_Attempt2
//
//  Created by Sonam Dhingra on 5/24/13.
//  Copyright (c) 2013 Sonam Dhingra. All rights reserved.
//

#import "StudyHallTipsDetailViewController.h"

@interface StudyHallTipsDetailViewController ()

@end

@implementation StudyHallTipsDetailViewController

@synthesize studyHallSelectedForDetails;
@synthesize studyhallNameLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    studyhallNameLabel.text= studyHallSelectedForDetails.title;
    
  // NSArray *tipArrayForDetails =  [NSArray  arrayWithArray:studyHallSelectedForDetails.tipList];
   
    NSLog(@"the tiparray for details has %@",studyHallSelectedForDetails.tipList);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1; 
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSString *identifier = @"myIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];



}
    cell.textLabel.text = @"sonam";
    return cell;

}

@end
