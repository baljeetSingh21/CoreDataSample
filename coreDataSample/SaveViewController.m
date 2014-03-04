//
//  SaveViewController.m
//  coreDataSample
//
//  Created by Vicky Mathneja on 10/09/13.
//  Copyright (c) 2013 LPU. All rights reserved.
//

#import "SaveViewController.h"
#import "StaffRecord.h"
@interface SaveViewController ()
{
    StaffRecord *saveRecord;
}
@end

@implementation SaveViewController
@synthesize managedOBJSettings;
@synthesize Staffname,StaffID,Address,btnSave,Contact,EnterID;;
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
    // Do any additional setup after loading the view from its nib.
}
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (IBAction)SaveButtonClicked:(id)sender {
   managedOBJSettings= [self managedObjectContext];
       // Create a new managed object
    StaffRecord *recent=(StaffRecord *)[NSEntityDescription insertNewObjectForEntityForName:@"StaffRecord" inManagedObjectContext:managedOBJSettings];
   // NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"StaffRecord" inManagedObjectContext:context];
    [recent setValue:[NSNumber numberWithInt:[self.StaffID.text intValue]] forKey:@"staffID"];
    [recent setValue:self.Staffname.text forKey:@"staffName"];
    [recent setValue:self.Address.text forKey:@"address"];
    [recent setValue:[NSNumber numberWithInt:[self.Contact.text intValue]] forKey:@"contactNo"];
    NSError *error = nil;
    // Save the object to persistent store
    if (![managedOBJSettings save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Successfully Saved New Record " message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}
-(IBAction)ClearArea:(id)sender
{
    for (UIView*v in self.view.subviews) {
        if ([v tag]==21 || [v tag]==22|| [v tag]==23||[v tag]==24) {
           
        }
        else
        {
            
                    [v removeFromSuperview];
                              
        }
    }
    [enterpta resignFirstResponder];
    [enterphone resignFirstResponder];
    [enterIDdel resignFirstResponder];
    [enternaam resignFirstResponder];
    

    [EnterID resignFirstResponder];
    [StaffID resignFirstResponder];
    [Staffname resignFirstResponder];
    [Address resignFirstResponder];
    [Contact resignFirstResponder];
}
-(IBAction)getData:(id)sender
{
    enternaam.hidden=YES;
    enterphone.hidden=YES;
    enterpta.hidden=YES;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =[NSEntityDescription
                                  entityForName:@"StaffRecord" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
       NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:EnterID.text];
   
    NSPredicate *lid=[NSPredicate predicateWithFormat:@"staffID==%@",myNumber];
    [fetchRequest setPredicate:lid];
    NSError *requestError = nil;
    
    DataTable =[self.managedObjectContext executeFetchRequest:fetchRequest
                                                 error:&requestError];
    if ([DataTable count]==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"No Record" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    NSManagedObject*obj=[DataTable objectAtIndex:0];
    lblID.text=[[obj valueForKey:@"staffID"] stringValue];
    lblName.text=[obj valueForKey:@"staffName"];
    lblAddress.text=[obj valueForKey:@"address"];
    lblContact.text=[[obj valueForKey:@"contactNo"] stringValue];
    }
        //NSlog(@"%@",DataTable);
      
    

}
-(IBAction)getToDel:(id)sender
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =[NSEntityDescription
                                  entityForName:@"StaffRecord" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:enterIDdel.text];
    
    NSPredicate *lid=[NSPredicate predicateWithFormat:@"staffID==%@",myNumber];
    [fetchRequest setPredicate:lid];
    NSError *requestError = nil;
    
    DataTable1 =[self.managedObjectContext executeFetchRequest:fetchRequest
                                                        error:&requestError];
    if ([DataTable1 count]==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Already Deleted Record" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    NSManagedObject*obj=[DataTable objectAtIndex:0];
   
    lblN.text=[obj valueForKey:@"staffName"];
    lblAdd.text=[obj valueForKey:@"address"];
    lblCont.text=[[obj valueForKey:@"contactNo"] stringValue];
    }
 
}
-(IBAction)DeleteData:(id)sender
{
    managedOBJSettings= [self managedObjectContext];
    [managedOBJSettings deleteObject:[DataTable1 objectAtIndex:0]];
    
    NSError *error = nil;
    if (![managedOBJSettings save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Successfully Delete" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(IBAction)updation:(id)sender
{
     managedOBJSettings= [self managedObjectContext];
    
    NSEntityDescription *uLoc=[NSEntityDescription entityForName:@"StaffRecord" inManagedObjectContext:managedOBJSettings];
    NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
    [fetch setEntity:uLoc];
    //[fetch setFetchLimit:5];
    //NSlog(@"%@",loc_id);
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:EnterID.text];
    
    NSPredicate *lid=[NSPredicate predicateWithFormat:@"staffID==%@",myNumber];
    [fetch setPredicate:lid];
   
    //... add sorts if you want them
    NSError *fetchError;
    NSMutableArray *fetchedResult1=[[self.managedObjectContext executeFetchRequest:fetch error:&fetchError] mutableCopy];
  
    
    for (NSManagedObject *result in fetchedResult1) {
        //NSlog(@"%@",result);
        
        
        
        [result setValue:enternaam.text forKey:@"staffName"];
        [result setValue:enterpta.text forKey:@"address"];
        [result setValue:[NSNumber numberWithInt:[enterphone.text intValue]] forKey:@"contactNo"];
       
        [self.managedObjectContext save:nil];
    }
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Successfully Updated" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(IBAction)CLickToAddEnterRecordView:(id)sender
{
    for (UIView*v in self.view.subviews) {
        if ([v tag]==21 || [v tag]==22|| [v tag]==23||[v tag]==24) {
            
        }
        else
        {
            
            [v removeFromSuperview];
            
        }
    }
    [self.view addSubview:SaveRecordV];
    SaveRecordV.frame=CGRectMake(10, 84, 300, 250);
}
-(IBAction)CLickToAddGetRecordView:(id)sender
{
    for (UIView*v in self.view.subviews) {
        if ([v tag]==21 || [v tag]==22|| [v tag]==23||[v tag]==24) {
            
        }
        else
        {
            
            [v removeFromSuperview];
            
        }
    }
    
    [self.view addSubview:getRecordV];
    getRecordV.frame=CGRectMake(10, 84, 300, 250);
}
-(IBAction)delView:(id)sender
{
    for (UIView*v in self.view.subviews) {
        if ([v tag]==21 || [v tag]==22|| [v tag]==23||[v tag]==24) {
            
        }
        else
        {
            
            [v removeFromSuperview];
            
        }
    }
    [self.view addSubview:DelRecordV];
    DelRecordV.frame=CGRectMake(10, 84, 300, 250);
}
-(IBAction)updateViews:(id)sender
{
    enternaam.hidden=NO;
    enterphone.hidden=NO;
    enterpta.hidden=NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
