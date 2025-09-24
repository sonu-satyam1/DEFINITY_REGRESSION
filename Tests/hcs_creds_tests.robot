*** Settings ***
Documentation        Definity
Library            SeleniumLibrary
Library           ScreenCapLibrary
Test Setup        open browser with url and login
Test Teardown     close browser session
Resource          ../Resources/resource.robot
Resource          ../POM/HCS_CREDENTIALS.robot
Library           String


*** Test Cases ***
Verify Expired/Past Due quick filter with show verified toggle enabled
    open credentials page on hcs side
    Apply Expired / Past Due quick filter
    enable Show Verified Documents toggle
    get ExpiredPastDue quick filter name Validate
    get expired/past due creds count from quick filter and store as global variable
    get expired/past due creds count from list and store as global variable and validate

Verify Pending Verification quick filter with show verified toggle enabled
    open credentials page on hcs side
    Apply Pending Verification quick filter
    enable Show Verified Documents toggle
    get Pending Verification quick filter name Validate
    get Pending Verification creds count from quick filter and store as global variable
    get Pending Verification creds count from list and store as global variable and validate

Verify Pending Upload quick filter with show verified toggle enabled
    open credentials page on hcs side
    Apply Pending upload quick filter
    enable Show Verified Documents toggle
    get Pending upload quick filter name Validate
    get Pending upload creds count from quick filter and store as global variable
    get Pending upload creds count from list and store as global variable and validate

Verify Rejected quick filter with show verified toggle enabled
    open credentials page on hcs side
    Apply Pending upload quick filter
    enable Show Verified Documents toggle
    Apply Rejected quick filter
    get Rejected quick filter name Validate
    Get Rejected Creds Count From Quick Filter And Store As Global Variable
    get Rejected creds count from list and store as global variable and validate

Verify Expiring quick filter with show verified toggle enabled
    open credentials page on hcs side
    Apply expiring quick filter
    enable Show Verified Documents toggle
    get expiring quick filter name Validate
    get Expiring creds count from quick filter and store as global variable
    get Expiring creds count from list and store as global variable and validate

Verify pending upload quick filter should filter credentials with pending upload status and sent
    open credentials page on hcs side
    Apply Pending upload quick filter
    enable Show Verified Documents toggle
    after applying pending upload quick filter validate that pending upload and sent status creds should be present in list


Verify by uploading credential for Pending Upload status and check whether the status is updated to pending verification
    open credentials page on hcs side
    open column filter for credential status
    select pending upload column filter
    click on filter button
    open upload credential window
    upload credential file
    capture credential file name and store as variable
    open effective date calender and enter date
    open expiration date calender and enter date
    uncheck verify checkbox
    click on save button
    Hard Refresh Page
    open column filter for credential status
    Select Pending Verification Column Filter
    click on filter button
    click on open column filter for document
    search with uploaded document name
    click on filter button
    validate pending upload changed to pending verification status

Verify Pending Verification Status credentials can be rejected and status will get changed to rejected
    open credentials page on hcs side
    open column filter for credential status
    Select Pending Verification Column Filter
    click on filter button
    click on open column filter for document
    search with uploaded document name
    click on filter button
    open pending verification credential details
    reject credentials with reason
    open jobs page
    open credentials page on hcs side
    Hard Refresh Page
    open column filter for credential status
    Select Rejected Column Filter
    click on filter button
    click on open column filter for document
    search with uploaded document name
    click on filter button
    validate pending verification changed to rejected status

Verify by uploading credential for Pending Upload status and check whether the status is updated to pending verification again
    open credentials page on hcs side
    open column filter for credential status
    select pending upload column filter
    click on filter button
    open upload credential window
    upload credential file
    capture credential file name and store as variable
    open effective date calender and enter date
    open expiration date calender and enter date
    uncheck verify checkbox
    click on save button
    Hard Refresh Page
    open column filter for credential status
    Select Pending Verification Column Filter
    click on filter button
    click on open column filter for document
    search with uploaded document name
    click on filter button
    validate pending upload changed to pending verification status

Verify Pending Verification Status credentials can be verified and status will get changed to verified

    open credentials page on hcs side
    open column filter for credential status
    Select Pending Verification Column Filter
    click on filter button
    click on open column filter for document
    search with uploaded document name
    click on filter button
    open pending verification credential details
    verify credentials
    open jobs page
    open credentials page on hcs side
    Hard Refresh Page
    enable Show Verified Documents toggle
    open column filter for credential status
    Select verified Column Filter
    click on filter button
    click on open column filter for document
    search with uploaded document name
    click on filter button
    validate pending verification changed to verified status


#verify column filters functionality
Verify Column filters for verified status column filter is filtering credentials properly
    open credentials page on hcs side
    enable Show Verified Documents toggle
    open column filter for credential status
    Select verified Column Filter
    click on filter button
    after column filter validate data for verified credentials are filtered

Verify Column filters for pending upload status column filter is filtering credentials properly
    open credentials page on hcs side
    open column filter for credential status
    select pending upload column filter
    click on filter button
    after column filter validate data for pending upload credentials are filtered

Verify Column filters for pending verification status column filter is filtering credentials properly
    open credentials page on hcs side
    open column filter for credential status
    Select Pending Verification Column Filter
    click on filter button
    after column filter validate data for pending verification credentials are filtered

Verify Column filters for expired status column filter is filtering credentials properly
    open credentials page on hcs side
    open column filter for credential status
    Select Expired Column Filter
    click on filter button
    after column filter validate data for Expired credentials are filtered

Verify Column filters for rejected status column filter is filtering credentials properly
    open credentials page on hcs side
    open column filter for credential status
    Select Rejected Column Filter
    click on filter button
    after column filter validate data for Rejected credentials are filtered

Verify Column filters for sent status column filter is filtering credentials properly
    open credentials page on hcs side
    open column filter for credential status
    Select Sent Column Filter
    click on filter button
    after column filter validate data for Sent credentials are filtered


#create view and validate
create view and validate
    open credentials page on hcs side
    Apply Pending upload quick filter
    click on create view open button
    click on save as view button
    click on save as view button
    enter view name
    click on save view button
    validate that view is created successfully

#create subscription
create subscription
    open credentials page on hcs side
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
    open credentials page on hcs side
    click on create subscription open button
    click on export csv option

#search text field functionality
search text field functionality
    open credentials page on hcs side
    go to default view
    enter credential name in search box
    validate that credential is filtered properly



