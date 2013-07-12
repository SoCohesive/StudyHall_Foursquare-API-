//
//  StudyHallTipsDetailViewController.h
//  StudyHall_Attempt2
//
//  Created by Sonam Dhingra on 5/24/13.
//  Copyright (c) 2013 Sonam Dhingra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenueClass.h"

@interface StudyHallTipsDetailViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *studyhallNameLabel;


@property (strong,nonatomic) NSArray *tipArrayForDetails;
@property (strong,nonatomic) VenueClass   *studyHallSelectedForDetails; 

@end
