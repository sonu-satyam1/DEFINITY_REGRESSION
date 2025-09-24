*** Settings ***
Documentation        Definity
Library            SeleniumLibrary
Library           ScreenCapLibrary
Test Setup        open browser with url and login
Test Teardown     close browser session
Resource        ../Resources/resource.robot
Resource        ../POM/BULK_EDIT.robot
Resource        ../POM/Vendor.robot
Library         String


*** Test Cases ***
Verify if user is able to select all jobs
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select all jobs
    bulk edit jobs
Verify if user is able to bulk select jobs to edit with open status
    open jobs page
    Open positions/All Job Requisites
    Filter open jobs
    enable bulk edit option
    select first job for bulk edit
    bulk edit jobs

Verify if user is able to bulk select jobs to edit with offer pending approval status
    open jobs page
    Open positions/All Job Requisites
    Filter pending approval jobs
    enable bulk edit option
    select first job for bulk edit
    bulk edit jobs

Verify user is not able to bulk edit the jobs when the status is Offers accepted, Filled,Completed, Rejected, Closed Status for jobs
    open jobs page
    open all job requisitions
    Filter jobs that should not be bulk edited
    enable bulk edit option
    edit selected rows option should be disabled

Verify if user is able to unselect all jobs
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select all jobs
    deselect all jobs

Verify if "Edit selected rows" button is enabled only when atleast 1 job is selected.
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    edit selected rows option should be enabled

Verify if user is able to add new tags on edit
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    edit add tag in bulk edit window
    add custom tag in bulk edit window
    submit bulk edit option
    close bulk edit window after successful edit
#    open jobs page
#    Open positions/All Job Requisites
    search job by job id
    select first job from list after search
    view job details page
    validate tag is added successfully to job


Verify if user is able to add existing tags on edit
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    bulk edit jobs
    edit add tag in bulk edit window
    select existing tag in bulk edit window and select
    submit bulk edit option

Verify if user is able to add max of 5 tags
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    edit add tag in bulk edit window
    select existing tag in bulk edit window and select
    select five existing tag in bulk edit window and select
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    move to tags and get all tags and store in list and validate


Verify the Pay package tab header info
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    store pay package header in variable
    validate actual pay package header with expected pay package header

Verify if regular rate is blank by default
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    regular rate field is blank in bulk edit jobs window        //input[@id='regularRate']

Verify if regular rate is updated in job after bulk edit
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    enter regular rate in bulk edit jobs window
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    open pay package tab on view job details page
    click on view details option of pay package tab on view job details page
    open pay package tab on view job details page and capture the regular rate and validate


Verify if Regular rate can be left blank
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    bulk edit jobs
    edit add tag in bulk edit window
    select existing tag in bulk edit window and select
    open pay package tab in bulk edit job window
    regular rate field is blank in bulk edit jobs window    //input[@id='regularRate']
    submit bulk edit option


Verify the Pay package for existing Talents after Regular rate is updated , Must consider the old rate
    open jobs page
    Open positions/All Job Requisites
    Filter open jobs
    Apply applicants quick filter
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    enter regular rate in bulk edit jobs window
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    open pay package tab on view job details page
    click on view details option of pay package tab on view job details page
    open pay package tab on view job details page and capture the regular rate and validate
    click on talent tab on view job order page
    open talent details on talent tab on view job order page
    open pay package tab on job talents details page
    get regular rate for talent for job talent details page and validate with updated regular rate

Verify the Pay package for new Talents after Regular rated are updated, Must consider the updated rates
    open jobs page
    Open positions/All Job Requisites
    Filter open jobs
    Apply applicants quick filter
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    enter regular rate in bulk edit jobs window
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    open pay package tab on view job details page
    click on view details option of pay package tab on view job details page
    open pay package tab on view job details page and capture the regular rate and validate
    open history tab in job order details page
    open add vendor tab
    Add Vendor to a job order details    ${Vendor_name}
    open vendor portal and login
    open jobs page in vendor portal
    filter job by job id in vendor portal
    click on check all option in filter window on jobs page in vendor portal
    click on filter option in filter window on jobs page in vendor portal
    select first job from the list on jobs page in vendor portal
    click on submit talent in talent details page in vendor portal
    fill talent details while submitting talent in vendor portal
    click on step2 while submitting the talent to a job in vendor side
    capture the updated regular rate and validate the talent is submitted to updated regular rate to a job in vendor side

#ot rules
Verify if the OT rules are unselected by default
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    Validate Whether Daily Weekly And Consecutive Days Are Unchecked By Default

Verify if user is able to edit job with OT - Daily enabled with 1 rule or more rules
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    add ot rules for daily
    submit bulk edit option

Verify if user is able to edit job with OT - Weekly enabled with 1 rule or more rules
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    add ot rules for weekly
    submit bulk edit option


Verify if user is able to edit job with OT - Consecutive days enabled with 1 rule or more rules
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    add ot rules for Consecutive Days
    submit bulk edit option

Verify if user is able to edit job with all the 3 OT rules enabled
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    add ot rules for daily
    add ot rules for weekly
    add ot rules for Consecutive Days
    submit bulk edit option

Verify if OT rules can be left blank - Daily, weekly and Consecutive days
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    enter regular rate in bulk edit jobs window
    Validate Whether Daily Weekly And Consecutive Days Are Unchecked By Default
    submit bulk edit option
    close bulk edit window after successful edit

Verify the Pay package for existing Talents after OT are updated Must consider the old rate
    open jobs page
    Open positions/All Job Requisites
    Filter open jobs
    Apply applicants quick filter
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    enter regular rate in bulk edit jobs window
    add ot rules for daily
    add ot rules for weekly
    add ot rules for Consecutive Days
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    open pay package tab on view job details page
    click on view details option of pay package tab on view job details page
    open pay package tab on view job details page and capture the regular rate and validate
    click on talent tab on view job order page
    open talent details on talent tab on view job order page
    open pay package tab on job talents details page
    get regular rate for talent for job talent details page and validate with updated regular rate

Verify the Pay package for new Talents after OT are updated Must consider the updated rates
    open jobs page
    Open positions/All Job Requisites
    Filter open jobs
    Apply applicants quick filter
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    enter regular rate in bulk edit jobs window
    add ot rules for daily
    add ot rules for weekly
    add ot rules for Consecutive Days
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    open pay package tab on view job details page
    click on view details option of pay package tab on view job details page
    open pay package tab on view job details page and capture the regular rate and validate
    open history tab in job order details page
    open add vendor tab
    Add Vendor to a job order details    ${Vendor_name}
    open vendor portal and login
    open jobs page in vendor portal
    filter job by job id in vendor portal
    click on check all option in filter window on jobs page in vendor portal
    click on filter option in filter window on jobs page in vendor portal
    select first job from the list on jobs page in vendor portal
    click on submit talent in talent details page in vendor portal
    fill talent details while submitting talent in vendor portal
    click on step2 while submitting the talent to a job in vendor side
    capture the updated regular rate and validate the talent is submitted to updated regular rate to a job in vendor side

#add credentials
Verify if user is able to add a credential on edit
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    capture first credential from dropdown name in variable in bulk edit job window
    select first credential from dropdown in bulk edit job window
    open action dropdown and add credential
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    open credentials tab on job order details
    open required at start tab in credentials tab on job order details
    get all credentials list from required at start and store in a list on job order details and validate that added credential should be present in list

Based on the text value entered, matching credentials should be filtered and displayed
    open jobs page
    Open positions/All Job Requisites
    Filter jobs that can be bulk edited
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    capture first credential from dropdown name in variable in bulk edit job window
    enter random credential in dropdown text field
    validate in dropdown only credentials related to search text is displayed

Do not select Credential Name field and Action dropdown value, enter regular rate or start date value, Submit button should be enabled
    open jobs page
    Open positions/All Job Requisites
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open pay package tab in bulk edit job window
    enter regular rate in bulk edit jobs window
    validate submit bulk edit button is enabled
Select any Credential Name field and select the Action dropdown value, Submit button should be enabled
    open jobs page
    Open positions/All Job Requisites
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    select first credential from dropdown in bulk edit job window
    open action dropdown and add credential
    validate submit bulk edit button is enabled

Select any Credential Name field and do not select the Action dropdown value, Submit button should be disabled
    open jobs page
    Open positions/All Job Requisites
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    select first credential from dropdown in bulk edit job window
    validate submit bulk edit button is disabled

Click on the Action dropdown value and verify the dropdown values displayed, Add and Remove should be displayed
    open jobs page
    Open positions/All Job Requisites
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    select first credential from dropdown in bulk edit job window
    open action dropdown and capture actions and validate

Click on the Add Credential link and verify the modal behavior, New row for credential name and Action should be displayed
    open jobs page
    Open positions/All Job Requisites
    enable bulk edit option
    select first job for bulk edit
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    select first credential from dropdown in bulk edit job window
    open action dropdown and add credential
    open + Add Credential menu
    validate second credential dropdown by adding new credential and capture name
    validate second action dropdown by adding new action
    validate submit bulk edit button is enabled

Verify if user is able to remove a credential on edit
    open jobs page
    Open positions/All Job Requisites
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    capture first credential from dropdown name in variable in bulk edit job window
    select first credential from dropdown in bulk edit job window
    open action dropdown and add credential
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    capture first credential from dropdown name in variable in bulk edit job window
    select first credential from dropdown in bulk edit job window
    open action dropdown and remove credential
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    open credentials tab on job order details
    open required at start tab in credentials tab on job order details
    get all credentials list from required at start and store in a list on job order details and validate that removed credential should not be present in list

Verify when no credential is added or removed on bulk edit,Jobs must retain their existing credentials
    open jobs page
    Open positions/All Job Requisites
    store job id of first job from listing page
    select first job from list after search
    view job details page
    open credentials tab on job order details
    open required at start tab in credentials tab on job order details
    get all credentials list from required at start and store in a list on job order details before job edit
    open jobs page
    Open positions/All Job Requisites
    search job by job id
    enable bulk edit option
    select first job for bulk edit
    bulk edit jobs
    open pay package tab in bulk edit job window
    enter regular rate in bulk edit jobs window
    submit bulk edit option
    close bulk edit window after successful edit
    select first job from list after search
    view job details page
    open credentials tab on job order details
    open required at start tab in credentials tab on job order details
    get all credentials list from required at start and store in a list on job order details before job edit
    Validate creds list before and after without editing job is same

Verify if user is able to add and remove multiple credential on edit
    open jobs page
    Open positions/All Job Requisites
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    capture first credential from dropdown name in variable in bulk edit job window
    select first credential from dropdown in bulk edit job window
    open action dropdown and add credential
    open + Add Credential menu
    validate second credential dropdown by adding new credential and capture name
    validate second action dropdown by adding new action
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    open credentials tab on job order details
    open required at start tab in credentials tab on job order details
    get all credentials list from required at start and store in a list on job order details after job edit
    validate both first and second cred should present in list after bulk edit
#remove
    open jobs page
    Open positions/All Job Requisites
    enable bulk edit option
    select first job for bulk edit
    store job id of first job from listing page
    bulk edit jobs
    open credentials tab in bulk edit job window
    open credentials dropdown in bulk edit job window
    capture first credential from dropdown name in variable in bulk edit job window
    select first credential from dropdown in bulk edit job window
    open action dropdown and remove credential
    open + Add Credential menu
    validate second credential dropdown by adding new credential and capture name
    open second action dropdown and remove credential
    submit bulk edit option
    close bulk edit window after successful edit
    search job by job id
    select first job from list after search
    view job details page
    open credentials tab on job order details
    open required at start tab in credentials tab on job order details
    get all credentials list from required at start and store in a list on job order details after job edit
    validate both first and second cred should not be present in list after bulk edit






















