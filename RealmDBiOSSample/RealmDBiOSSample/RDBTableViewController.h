//
//  RDBTableViewController.h
//  RealmDBiOSSample
//
//  Created by shiva  kumar on 16/05/18.
//

#import <UIKit/UIKit.h>
#import "Songs.h"

@interface RDBTableViewController : UITableViewController

//Properties
@property(nonatomic,strong) RLMResults *songList;

@end
