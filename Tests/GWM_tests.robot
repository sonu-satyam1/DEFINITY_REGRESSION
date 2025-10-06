*** Settings ***
Documentation        Definity
Library            SeleniumLibrary
Library           ScreenCapLibrary
Test Setup        open browser with url and login
Test Teardown     close browser session
Resource        ../Resources/resource.robot
Resource        ../POM/GWM_FloatPool.robot
Resource        ../POM/GWM_Schedules.robot
Resource        ../POM/GWM_Dashboard.robot

Library         String
Library         DateTime
Library        String
Library        Collections

*** Test Cases ***
Verify float pool lists all talents with "on assignment" or "early end" whose contracts end today or in the future
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    open first talent details from talent pool page and store name in variable
    navigate to hcs core page
    open core talents page
    search for talent details in submittals placements tab on core talents page
    open talent details on core talents page
    validate talent status should be on assignment or early end
    Validate End Date Is Today Or Future

Verify filter location return correct results
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    Filter Float Location And Validate

Verify filter department return correct results
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    Filter Float Department And Validate

Verify filter skills return correct results
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    Filter Float Skills And Validate

#quick filters
Validate quick filter contract ending in 30days
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    click on contract ending in 30days quick filter
    get contact ending in 30days quick filter count
    validate contact ending in 30days quick filter count

Validate quick filter contract ending in 60days
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    click on contract ending in 60days quick filter
    get contact ending in 60days quick filter count
    validate contact ending in 60days quick filter count

#create view and validate
create view and validate
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    click on create view open button
    click on save as view button
    click on save as view button
    enter view name
    click on save view button
    validate that view is created successfully

#create subscription
create subscription
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    click on create subscription open button
    click on create subscription option
    select start date in create subscription form
    select end date in create subscription form
    enter time in create subscription form
    open repeat dropdown and select daily in create subscription form
    enter email subject in create subscription form
    enter email content in create subscription form
    click on schedule in create subscription form

#export csv
export csv
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    click on create subscription open button
    click on export csv option

Verify search by talent name works correctly
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    open first talent details from talent pool page and store name in variable
    make search by talent name
    validate only searched talent is displayed

Validate talent details start/end date, location, qualifications are displayed correctly
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    open first talent details from talent pool page and store name in variable
    open first talent details from talent pool page and store start/end date, location, qualifications in variable
    navigate to hcs core page
    open core talents page
    search for talent details in submittals placements tab on core talents page
    open talent details on core talents page
    open first talent details from hcs talents page and store start/end date, location, qualifications in variable
    Validate Talent Details Match

Validate float area auto-matches skills and shows other eligible locations within a 50-mile radius
    navigate to gwm page
    navigate to FloatPool Page from welcome page
    open first talent details from talent pool page and store name in variable
    Validate Miles Are Within 50


#create shifts
Validate ability to create open shifts from dashboard
    navigate to gwm page
    navigate to Dashboard Page from welcome page
    click on add shift option on gwm dashboard page
    open location/dept dropdown on add shift window
    select location/dept from dropdown on add shift window
    open skills dropdown on add shift window
    select skills from dropdown on add shift window
    open work type dropdown on add shift window
    select work type from dropdown on add shift window
    open shift dropdown on add shift window
    select shift from dropdown on add shift window
    select date from calender
    click on add shift button

Verify that GWM user can edit an open PUBLIC shift
    navigate to gwm page
    navigate to Schedules Page from welcome page
    go to manage open shifts on schedules page
    open shift date dropdown and select next 30days
    open visibility filter and filter open public shifts
    select first shift from the list
    open shift edit dropdown and edit private shift
    edit number of opening edit shift window
    click on save on edit shift window

Validate ability to create open shifts from schedule view
    navigate to gwm page
    navigate to Schedules Page from welcome page
    open schedule details page
    click on add shift option on gwm schedule details page
    open skills dropdown on add shift window
    select skills from dropdown on add shift window
    open work type dropdown on add shift window
    select work type from dropdown on add shift window
    open shift dropdown on add shift window
    select shift from dropdown on add shift window
    select date from calender
    click on add shift button on schedule details page

Validate ability to create open shifts by double tap on calender
    navigate to gwm page
    navigate to Schedules Page from welcome page
    open schedule details page
    double tap on schedule details page
    open skills dropdown on add shift window
    select skills from dropdown on add shift window
    open work type dropdown on add shift window
    select work type from dropdown on add shift window
    open shift dropdown on add shift window
    select shift from dropdown on add shift window
    select date from calender
    click on add shift button on schedule details page

Validate ability to create schedule shifts from dashboard
    navigate to gwm page
    navigate to Dashboard Page from welcome page
    click on add shift option on gwm dashboard page
    click on create schedule shifts radio button
    Select Location And Talent Until Option Appears on Add scheduled shift window
    open work type dropdown on add shift window
    select work type from dropdown on add shift window
    go to next page on calender on add shift window
    select date from calender
    click on add shift button

Validate ability to create schedule shifts from schedule view
    navigate to gwm page
    navigate to Schedules Page from welcome page
    open schedule details page
    click on add shift option on gwm schedule details page
    click on create schedule shifts radio button
    select talent while adding schedule shift on schedule view
    open work type dropdown on add shift window
    select work type from dropdown on add shift window
    go to next page on calender on add shift window
    select date from calender
    click on add shift button on schedule details page
    
Validate ability to create schedule shifts by double-tap on calender
    navigate to gwm page
    navigate to Schedules Page from welcome page
    open schedule details page
    double tap on schedule details page
    click on create schedule shifts radio button
    select talent while adding schedule shift on schedule view
    open work type dropdown on add shift window
    select work type from dropdown on add shift window
    go to next page on calender on add shift window
    select date from calender
    click on add shift button on schedule details page

#GWM Dashboard test cases
Verify that on clicking on "local contracts ending 30 days" , it directs user to float pool with quick filter "contract ends in 30 days " enabled
    navigate to gwm page
    navigate to Dashboard Page from welcome page
    click on Local Contracts Ending in 30 days hyperlink on gwm dashboard
    Validate by clicking on Local Contracts Ending in 30 days hyperlink on gwm dashboard it directs user to float pool with quick filter "contract ends in 30 days " enabled


Verify that on clicking on "shifts need confirmation " , it directs user to schedule's manage open shift page with quick fiter "need confirmation" enabled
    navigate to gwm page
    navigate to Dashboard Page from welcome page
    click on Shifts Need Confirmation hyperlink on gwm dashboard
    Validate by clicking on Shifts Need Confirmation hyperlink on gwm dashboard it directs user to schedule's manage open shift page with quick fiter "need confirmation" enabled


Verify that a shift can be closed from open shift calendar list
    navigate to gwm page
    navigate to Dashboard Page from welcome page
    click on close shift option in open shifts table and click on continue

Verify that a shift can be offered from open shift calendar list
    navigate to gwm page
    navigate to Dashboard Page from welcome page
    click on offer shift option in open shifts table
    select talent to offer shift and offer shift


Verify that GWM user can add an open PRIVATE shift
    navigate to gwm page
    navigate to Dashboard Page from welcome page
    click on add shift option on gwm dashboard page
    enable private toggle on create shift window
    open location/dept dropdown on add shift window
    select location/dept from dropdown on add shift window
    open skills dropdown on add shift window
    select skills from dropdown on add shift window
    open work type dropdown on add shift window
    select work type from dropdown on add shift window
    open shift dropdown on add shift window
    select shift from dropdown on add shift window
    select date from calender
    click on add shift button

Verify that GWM user can edit an open PRIVATE shift
    navigate to gwm page
    navigate to Schedules Page from welcome page
    go to manage open shifts on schedules page
    open shift date dropdown and select next 30days
    open visibility filter and filter private shifts
    select first shift from the list
    open shift edit dropdown and edit private shift
    edit number of opening edit shift window
    click on save on edit shift window

Verify that GWM user can edit an open PUBLIC shift & change it to private
    navigate to gwm page
    navigate to Schedules Page from welcome page
    go to manage open shifts on schedules page
    open shift date dropdown and select next 30days
    open visibility filter and filter open public shifts
    select first shift from the list
    open shift edit dropdown and edit private shift
    enable private toggle on edit open public shift
    edit number of opening edit shift window
    click on save on edit shift window

Verify that GWM user can edit an open PRIVATE shift & change it to PUBLIC
    navigate to gwm page
    navigate to Schedules Page from welcome page
    go to manage open shifts on schedules page
    open shift date dropdown and select next 30days
    open visibility filter and filter private shifts
    select first shift from the list
    open shift edit dropdown and edit private shift
    disable private toggle on edit open private shift
    edit number of opening edit shift window
    click on save on edit shift window

Verify that GWM user can close an open PRIVATE shift
    navigate to gwm page
    navigate to Schedules Page from welcome page
    go to manage open shifts on schedules page
    open shift date dropdown and select next 30days
    open visibility filter and filter private shifts
    select first shift from the list
    open shift edit dropdown and click on cancel shift
    click on continue for edit open shift

Verify that GWM user can close an open PUBLIC shift
    navigate to gwm page
    navigate to Schedules Page from welcome page
    go to manage open shifts on schedules page
    open shift date dropdown and select next 30days
    Open Visibility Filter And Filter Open Public Shifts
    select first shift from the list
    open shift edit dropdown and click on cancel shift
    click on continue for edit open shift

