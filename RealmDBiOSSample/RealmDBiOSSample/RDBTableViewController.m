//
//  RDBTableViewController.m
//  RealmDBiOSSample
//
//  Created by shiva  kumar on 16/05/18.
//

#import "RDBTableViewController.h"

@interface RDBTableViewController ()

- (RLMResults *)setUpSongsList;

@end

@implementation RDBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.songList = [self setUpSongsList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songcell" forIndexPath:indexPath];
 
    Songs *song = [self.songList objectAtIndex:indexPath.row];
    cell.textLabel.text = (![song.songTitle isEqual:@""] ) ? song.songTitle : @"No Title";
    cell.detailTextLabel.text = (![song.songArtist isEqual:@""] ) ? song.songArtist : @"No Artist";
 
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Songs List";
}


//Private method inplementation through Extensions

- (RLMResults *)setUpSongsList {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    // Clear the realm object
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm commitWriteTransaction];
    
    [realm beginWriteTransaction];
    
    [Songs createInRealm: realm withValue:@{@"songId": @1001, @"songTitle": @"a", @"songArtist": @"b"}];
    [Songs createInRealm: realm withValue:@{@"songId": @1001, @"songTitle": @"m", @"songArtist": @"n"}];
    [Songs createInRealm: realm withValue:@{@"songId": @1001, @"songTitle": @"p", @"songArtist": @"q"}];
    
    [realm commitWriteTransaction];
    
    return [Songs allObjects];
}

@end
