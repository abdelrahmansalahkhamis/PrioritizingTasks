//
//  Task.m
//  PrioritizingTasks
//
//  Created by abdrahman on 27/01/2022.
//

#import "Task.h"

@implementation Task
- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.taskName forKey:@"taskName"];
    [encoder encodeObject:self.taskDescription forKey:@"taskDescription"];
    [encoder encodeObject:self.taskPreirity forKey:@"taskPreirity"];
    [encoder encodeObject:self.taskdateOfCreation forKey:@"taskdateOfCreation"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.taskName = [decoder decodeObjectForKey:@"taskName"];
        self.taskDescription = [decoder decodeObjectForKey:@"taskDescription"];
        self.taskPreirity = [decoder decodeObjectForKey:@"taskPreirity"];
        self.taskdateOfCreation = [decoder decodeObjectForKey:@"taskdateOfCreation"];

    }
    return self;
}
@end
