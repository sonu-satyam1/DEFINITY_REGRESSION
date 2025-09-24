*** Settings ***
Documentation        Definity
Library        SeleniumLibrary
Library           ScreenCapLibrary
Test Setup        open browser with url and login
Test Teardown     close browser session
Resource        ../Resources/resource.robot
Resource        ../POM/Talent.robot
Resource        ../POM/Timecards_Expense.robot
Resource        ../POM/Invoices.robot



*** Test Cases ***


Edit submittal vendor pay package, credentials
    open talents page
    filter applicants
    select applied status talent
    edit applied status talent
    change the start date of applied status talent
    capture edited start date of submittal and compare with start date after saving


Edit placement vendor pay package, credentials
    open talents page
    filter on assignment talents
    select on assignment talent from the list
    edit on assignment talent
    edit end date of on assignment status talent save and validate after saving

Move submittal to Placement
    open talents page
    filter applied status talents
    select applied status talent
    shortlist applied status talent
    interview scheduled applied status talent
    interview complete applied status talent
    extend offer applied status talent

Submit the timecard
    open time cards
    filter pending submission time cards
    enter time in and time out
    open add document section
    upload file and save
    approve the time card

Approve the timecard
    open time cards
    filter pending approval timecard and expense
    filter timacard type
    select timecard or expense from list
    click approve timecard button

Approve the expense
    open time cards
    filter pending approval timecard and expense
    filter expense type
    select timecard or expense from list
    click approve expense button

rescind timecard and approve again
    open time cards
    filter approved status timecard and expense
    filter timacard type
    select timecard or expense from list
    edit timecard for rescind and continue again edit and approve

#add expense
#    open time cards
#    open add expense page
#    select talent from dropdown
#    select job from dropdown
#    lands to fill expense form
#    fill the expense form
#    open upload document section for expense
#    upload document for expense

Invoice the time cards with updated pay package details
    Open The Invoices Tab
    open ready to invoice
    select invoice from ready to invoice list
    invoice selected rows from ready to invoice list and generate invoice


Approve the invoice
    Open The Invoices Tab
    open invoices list
    filter submitted invoices
    select submitted status invoice and approve

#Rescind the invoice approval
#    Open The Invoices Tab
#    open invoices list
#    filter approved invoices
#    select approved or partially submitted invoice
#    edit approved invoice
#    rescind the approved invoice


Partial pay the invoice
    Open The Invoices Tab
    open invoices list
    filter approved invoices
    select approved or partially submitted invoice
    open Mark Invoice as Paid tab
    fill checkNumber and date in Mark Invoice as Paid tab
    Partial payment of the invoice
    submit partial or full payment


Full pay the invoice
    Open The Invoices Tab
    open invoices list
    filter partially submitted invoices
#    filter approved invoices
    select approved or partially submitted invoice
    open Mark Invoice as Paid tab
    fill checkNumber and date in Mark Invoice as Paid tab
    submit partial or full payment


moving pending start talents to on assignment manually
    open talents page
    select talent pool tab
    filter pending start talents
    select pending start candidate from list














