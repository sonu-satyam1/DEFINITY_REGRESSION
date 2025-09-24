*** Settings ***
Documentation        Definity
Library        SeleniumLibrary
Library           ScreenCapLibrary
Resource        ../Resources/resource.robot
#Resource        ../POM/Talent.robot
#Resource        ../POM/Timecards_Expense.robot
#Resource        ../POM/Invoices.robot
Resource        ../POM/Vendor_timecards_expense.robot
Resource        ../POM/HCS_timecards_expense.robot
Resource        ../POM/Invoices.robot

*** Test Cases ***
Submit timecards from vendor and validate on both hcs and vendor side
    open vendor portal and login
    go to timecards and expense section
    filter pending submission status timecrds and expense
    filter timecards
    go to last page of the timecards
    capture dates worked for first item of the last page
    select first item from the last page and capture placement id
    open add document section
    upload document and save
    fill the timecard time in
    fill the timeout
    submit timecard
    go to timecards and expense section
    filter timecards
    filter pending approval status timecrds and expense
    filter timecard on basis of dates worked
    validate on vendor side whether the timecard have correct dates worked
    Sleep    10s
#    Close Browser
    open hcs with url and login
    open hcs time cards
    filter hcs pending approval time cards and expense
    filter hcs timecards by dates worked
    filter hcs timecards by placement id
    select hcs timecard or expense from list
    verify hcs timecard status is in pending approval


submit expense from vendor side and validate in hcs and vendor
    open vendor portal and login
    go to timecards and expense section
    open add expense vendor side
    select organization from the list in vendor side
    select talent from the list in vendor side
    select jobs from list in vendor side and continue
    enter type and description in expense form
    upload document for expense in vendor side
    submit the expense
    go to timecards and expense section
    filter pending approval status timecrds and expense
    filter expense
    filter expense based on name
    select first expense from the list and validate name
    Sleep    10s
#    Close Browser
    open hcs with url and login
    open hcs time cards
    filter hcs pending approval time cards and expense
    filter hcs expense type
    filter hcs expense with name
    open hcs expense name and validate status


approve timecard from hcs side and validate on hcs and vendor side
    open hcs with url and login
    open hcs time cards
    filter hcs pending approval time cards and expense
    filter hcs timecard type
    select hcs timecard or expense from list
    capture dates worked after opening timecard or expense
    approve timecard from hcs side
    capture name and amount of approved timecard
    capture actual amount and name of approved timecard after approving timecard and validate
    Sleep    10s
    open vendor portal and login
    go to timecards and expense section
    filter timecards
    filter approved status timecrds and expense
    filter approved timecard based on name in vendor side
    filter approved timecard or expense on basis of date worked in vendor side
    select timecard or expense from list in vendor side
    validate name and dates worked of approved timecard in vendor side

approve expense from hcs side and validate on hcs and vendor side
    open hcs with url and login
    open hcs time cards
    filter hcs pending approval time cards and expense
    filter hcs expense type
    select hcs timecard or expense from list
    capture dates worked after opening timecard or expense
    approve expense from hcs side
    capture name and amount of approved expense
    capture actual amount and name of approved expense after approving expense and validate
    Sleep    10s
    open vendor portal and login
    go to timecards and expense section
    filter expense
    filter approved status timecrds and expense
    filter approved expense based on name in vendor side
    filter approved timecard or expense on basis of date worked in vendor side
    select timecard or expense from list in vendor side
    validate name and dates worked of approved expense in vendor side

Rescind approval view on vendor and core side
    open hcs with url and login
    open hcs time cards
    filter hcs pending approval time cards and expense
    filter hcs timecard type
    select hcs timecard or expense from list
    capture dates worked after opening timecard or expense
    approve timecard from hcs side
    capture name and amount of approved timecard
    rescind the approved timecard in hcs side
    validate name and status of rescind timecard
    Sleep    10s
    open vendor portal and login
    go to timecards and expense section
    filter timecards
    filter pending approval timecard based on name in vendor side
    filter pending approval status timecrds and expense
    filter pending approval timecard or expense on basis of date worked in vendor side
    select timecard or expense from list in vendor side
    validate name and dates worked of pending approval timecard in vendor side


Rescind approval edit and approve again and view on vendor and core side
    open hcs with url and login
    open hcs time cards
    filter hcs pending approval time cards and expense
    filter hcs timecard type
    select hcs timecard or expense from list
    capture dates worked after opening timecard or expense
    approve timecard from hcs side
    capture name and amount of approved timecard
    rescind the approved timecard in hcs side
    validate name and status of rescind timecard
    edit and approve timecard again after rescind
    open hcs time cards
    filter hcs approved time cards and expense
    filter hcs timecard type
    filter hcs timecard with name after approving again after rescind
    filter hcs timecards by dates worked after approving again after rescind
    select hcs timecard or expense from list
    validate name and status of rescind timecard after approving again after rescind
    Sleep    10s
    open vendor portal and login
    go to timecards and expense section
    filter timecards
    filter approved status timecrds and expense
    filter approved timecard based on name in vendor side
    filter approved timecard or expense on basis of date worked in vendor side
    select timecard or expense from list in vendor side
    validate name and dates worked of approved timecard in vendor side

Invoice the time cards with updated pay package details
    open hcs with url and login
    Open The Invoices Tab
    open ready to invoice
    select invoice from ready to invoice list
    invoice selected rows from ready to invoice list and generate invoice
    capture invoice number for the submitted invoice
    capture invoice status for submitted invoice and validate




































