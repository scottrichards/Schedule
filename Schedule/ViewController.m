//
//  ViewController.m
//  Schedule
//
//  Created by Scott Richards on 8/8/15.
//  Copyright (c) 2015 Scott Richards. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIDatePicker *startDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDatePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onSchedule:(id)sender {
  NSString *appointmentName = _nameField.text;
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
  NSManagedObjectContext *context = appDelegate.managedObjectContext;
  NSManagedObject *appointmentInfo = [NSEntityDescription
                                     insertNewObjectForEntityForName:@"Appointments"
                                     inManagedObjectContext:context];
  [appointmentInfo setValue:appointmentName forKey:@"name"];
  [appointmentInfo setValue:[NSDate date] forKey:@"start"];
  [appointmentInfo setValue:[NSDate date] forKey:@"end"];
  NSError *error;
  if (![context save:&error]) {
    NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
  }
}

#pragma mark - TextFieldDelegate

// dismiss the keyboard when user clicks on done
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
}
@end
