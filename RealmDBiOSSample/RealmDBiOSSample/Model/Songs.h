//
//  Songs.h
//  RealmDBiOSSample
//
//  Created by shiva  kumar on 16/05/18.
//

#import <Foundation/Foundation.h>
#import "Realm/Realm.h"

@interface Songs : RLMObject
//Properties
@property(nonatomic,assign) int songId;
@property(nonatomic,strong) NSString *songTitle;
@property(nonatomic,strong) NSString *songArtist;

@end
