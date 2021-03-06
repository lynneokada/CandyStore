//
//  ChatTableViewController.m
//  CandyTutorial
//
//  Created by Lynne Okada on 9/25/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "ChatTableViewController.h"

@interface ChatTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSDictionary *dictionary;

@end

@implementation ChatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
    self.chatList = [NSMutableArray new];
    
    NSURL *url = [NSURL URLWithString:@"http://10.0.32.225:3000/candy"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:request
                                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                       NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
                                                       NSInteger responseStatusCode = [httpResponse statusCode];
                                                       
                                                       if (responseStatusCode == 200 && data) {
                                                           NSArray *downloadedJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                           // do something with this data
                                                           // if you want to update UI, do it on main queue
                                                           for (int i = 0; i < [downloadedJSON count]; i++) {
                                                               [self.chatList addObject:downloadedJSON[i][@"chat"]];
                                                           }
                                                           dispatch_async(dispatch_get_main_queue(), ^{
                                                               [self.tableView reloadData];
                                                               
                                                           });
                                                       } else {
                                                           // error handling
                                                       }
                                                   }];
    
    [dataTask resume];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.chatList count];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.textField) {
        return YES;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.chatList addObject:self.textField.text];
    NSDictionary *dictionaryChat = [NSDictionary dictionaryWithObject:self.textField.text forKey:@"chat"];
    
    NSLog(@"%@", self.textField.text);
    //    [self.tableView reloadData];
    self.textField.text = @"";
    
    NSURL *url = [NSURL URLWithString:@"http://10.0.32.225:3000/candy"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [request setHTTPMethod:@"POST"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionaryChat options:0 error:nil];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    
    NSURLSessionUploadTask *dataUpload = [urlSession uploadTaskWithRequest:request fromData:jsonData completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        NSInteger responseStatusCode = [httpResponse statusCode];
        
        if (responseStatusCode == 200)
        {
            //            NSArray *downloadedJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"uploaded");
            
            NSURL *url = [NSURL URLWithString:@"http://10.0.32.225:3000/candy"];
            
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
            [request setHTTPMethod:@"GET"];
            
            NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
            
            NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:request
                                                           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                               NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
                                                               NSInteger responseStatusCode = [httpResponse statusCode];
                                                               
                                                               if (responseStatusCode == 200 && data) {
                                                                   NSArray *downloadedJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                                   // do something with this data
                                                                   // if you want to update UI, do it on main queue
                                                                   [self.chatList removeAllObjects];
                                                                   for (int i = 0; i < [downloadedJSON count]; i++) {
                                                                       [self.chatList addObject:downloadedJSON[i][@"chat"]];
                                                                   }
                                                                   dispatch_async(dispatch_get_main_queue(), ^{
                                                                       [self.tableView reloadData];
                                                                       
                                                                   });
                                                               } else {
                                                                   // error handling
                                                               }
                                                           }];
            
            [dataTask resume];
        }
        else {
            
        }
    }];
    
    [dataUpload resume];
    
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatCell" forIndexPath:indexPath];
    cell.textLabel.text = self.chatList[indexPath.row];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
