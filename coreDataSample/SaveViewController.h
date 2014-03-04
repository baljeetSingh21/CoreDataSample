//
//  SaveViewController.h
//  coreDataSample
//
//  Created by Vicky Mathneja on 10/09/13.
//  Copyright (c) 2013 LPU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveViewController : UIViewController
{
    IBOutlet UILabel*lblID;
    IBOutlet UILabel*lblName;
    IBOutlet UILabel*lblAddress;
    IBOutlet UILabel*lblContact;
    NSArray *DataTable;
    NSArray *DataTable1;
    IBOutlet UIView*SaveRecordV;
    IBOutlet UIView*getRecordV;
    IBOutlet UIView*DelRecordV;
    IBOutlet UIButton*btnclear;
    IBOutlet UIButton*btnENter;
    IBOutlet UIButton*btnget;
    IBOutlet UIButton*btndel;
       //for del view
    IBOutlet UILabel*lblN;
    IBOutlet UILabel*lblAdd;
    IBOutlet UILabel*lblCont;
    IBOutlet UITextField *enterIDdel;
    //for updation
    IBOutlet UITextField *enternaam;
    IBOutlet UITextField *enterpta;
    IBOutlet UITextField *enterphone;
}
@property (weak, nonatomic) IBOutlet UITextField *StaffID;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (weak, nonatomic) IBOutlet UITextField *Staffname;
@property (weak, nonatomic) IBOutlet UITextField *Address;
@property (weak, nonatomic) IBOutlet UITextField *Contact;
@property (weak, nonatomic) IBOutlet UITextField *EnterID;
@property(retain,nonatomic)NSManagedObjectContext*managedOBJSettings;
@end
