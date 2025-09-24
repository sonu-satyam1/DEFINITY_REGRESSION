*** Settings ***
Documentation    Definity
Library          SeleniumLibrary
Library          BuiltIn
Library          ScreenCapLibrary
Resource         ../Resources/resource.robot
Resource         ../Resources/variables.robot
Library          OperatingSystem
Library         Collections
Library         String
Variables       ../Resources/variable.py
Library         Random



*** Keywords ***

open credentials page on hcs side
    Wait Until Page Ready
    Wait Until Page Ready
    Wait Until Page Contains Element    //a[@href='/compliance' and @class='nav-link']    ${TIMEOUT}
    Wait Until Page Ready
    Mouse Over                          //a[@href='/compliance' and @class='nav-link']
    Wait Until Page Contains Element    //a[@href='/compliance' and @class='nav-link']    ${TIMEOUT}
    Click Element                       //a[@href='/compliance' and @class='nav-link']
    Wait Until Page Ready
    Mouse Over                          //*[text()='Expiring']
    Sleep                                ${WAIT_TIME}

open jobs page
    Wait Until Page Ready
    Wait Until Page Contains Element    //li[@class='nav-section-item active']//a    ${TIMEOUT}
    Wait Until Page Ready
    Mouse Over                          //li[@class='nav-section-item active']//a
    Wait Until Page Contains Element    //a[@href='/job-order']    ${TIMEOUT}
    Click Element                       //a[@href='/job-order']

enable Show Verified Documents toggle
    Wait Until Page Ready
    Wait Until Element Is Visible        //span[contains(@class,'k-switch k')]    ${TIMEOUT}
    Wait Until Element Is Enabled        //span[contains(@class,'k-switch k')]    ${TIMEOUT}
    Click Element                        //span[contains(@class,'k-switch k')]

#expired/past due
Apply Expired / Past Due quick filter
    Wait Until Page Ready
    Wait Until Element Is Visible       //*[contains(text(), 'Expiring')]
    Wait Until Element Is Enabled       //*[contains(text(), 'Expiring')]
    Mouse Over                          //*[contains(text(), 'Expiring')]
    Wait Until Element Is Visible       //*[contains(text(), 'Expired / Past Due')]        ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //*[contains(text(), 'Expired / Past Due')]
    Wait Until Page Ready
    
get ExpiredPastDue quick filter name Validate
    Wait Until Page Ready
    Wait Until Element Is Visible       //*[contains(text(), 'Expired / Past Due')]        ${TIMEOUT}
    Wait Until Page Ready
    ${ExpiredPastDue_quick_filter_name}=    Get Text      //*[contains(text(), 'Expired / Past Due')]
    Should Be Equal        ${ExpiredPastDue_quick_filter_name}        Expired / Past Due
    
    
get expired/past due creds count from quick filter and store as global variable
    Wait Until Element Is Visible                                //*[text()[normalize-space(.)='Expired / Past Due']]/ancestor::div[contains(@class, 'card-wrapper')]//h2            ${TIMEOUT}
    ${quick_filter_expired_past_due_name_count}=     Get Text    //*[text()[normalize-space(.)='Expired / Past Due']]/ancestor::div[contains(@class, 'card-wrapper')]//h2
    Set Global Variable      ${quick_filter_expired_past_due_name_count}    ${quick_filter_expired_past_due_name_count}
    Log                      ${quick_filter_expired_past_due_name_count}

get expired/past due creds count from list and store as global variable and validate
    Wait Until Element Is Visible                                 //span[@class='k-pager-info']                    ${TIMEOUT}
    Scroll Element Into View                                      //span[@class='k-pager-info']
    ${list_expired_past_due_name_count_}=    Get Text             //span[@class='k-pager-info']
    Set Global Variable        ${list_expired_past_due_name_count_}    ${list_expired_past_due_name_count_}
    Log                        ${list_expired_past_due_name_count_}
    Should Contain             ${list_expired_past_due_name_count_}    ${quick_filter_expired_past_due_name_count}
    
#pending verification
Apply Pending Verification quick filter
    Wait Until Page Ready
    Wait Until Element Is Visible       //*[contains(text(), 'Expiring')]                ${TIMEOUT}
    Wait Until Element Is Enabled       //*[contains(text(), 'Expiring')]                ${TIMEOUT}
    Mouse Over                          //*[contains(text(), 'Expiring')]
    Wait Until Element Is Visible       (//*[text()[normalize-space(.)='Pending Verification']])[1]        ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       (//*[text()[normalize-space(.)='Pending Verification']])[1]

get Pending Verification quick filter name Validate
    Wait Until Page Ready
    Wait Until Element Is Visible       (//*[text()[normalize-space(.)='Pending Verification']])[1]        ${TIMEOUT}
    Wait Until Page Ready
    ${pending_verification_quick_filter_name}=    Get Text      (//*[text()[normalize-space(.)='Pending Verification']])[1]
    Should Be Equal        ${pending_verification_quick_filter_name}        Pending Verification
    

get Pending Verification creds count from quick filter and store as global variable
    Wait Until Page Ready
    Wait Until Element Is Visible                                //*[text()[normalize-space(.)='Pending Verification']]/ancestor::div[contains(@class, 'card-wrapper')]//h2
    ${quick_pending_verification_count}=     Get Text            //*[text()[normalize-space(.)='Pending Verification']]/ancestor::div[contains(@class, 'card-wrapper')]//h2
    Set Global Variable      ${quick_pending_verification_count}    ${quick_pending_verification_count}
    Log                      ${quick_pending_verification_count}

get Pending Verification creds count from list and store as global variable and validate
    Wait Until Page Ready
    Wait Until Element Is Visible                                 //span[@class='k-pager-info']
    ${list_pending_verification_count}=    Get Text             //span[@class='k-pager-info']
    Set Global Variable        ${list_pending_verification_count}    ${list_pending_verification_count}
    Log                        ${list_pending_verification_count}
    Should Contain             ${list_pending_verification_count}    ${quick_pending_verification_count}


#pending upload
Apply Pending upload quick filter
    Wait Until Page Ready
    Wait Until Element Is Visible       (//*[contains(text(), 'Pending Upload')])[1]                ${TIMEOUT}
    Wait Until Element Is Enabled       (//*[contains(text(), 'Pending Upload')])[1]                ${TIMEOUT}
    Mouse Over                          (//*[contains(text(), 'Pending Upload')])[1]
    Wait Until Element Is Visible       (//*[contains(text(), 'Pending Upload')])[1]                ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       (//*[contains(text(), 'Pending Upload')])[1]



get Pending upload quick filter name Validate
    Wait Until Page Ready
    Wait Until Element Is Visible              (//*[contains(text(), 'Pending Upload')])[1]        ${TIMEOUT}
    Wait Until Page Ready
    ${pending_upload__name}=    Get Text       (//*[contains(text(), 'Pending Upload')])[1]
    Should Be Equal        ${pending_upload__name}        Pending Upload

get Pending upload creds count from quick filter and store as global variable
    Wait Until Page Ready
    Wait Until Element Is Visible                                //*[text()[normalize-space(.)='Pending Upload']]/ancestor::div[contains(@class, 'card-wrapper')]//h2
    ${quick_pending_upload_count}=     Get Text                  //*[text()[normalize-space(.)='Pending Upload']]/ancestor::div[contains(@class, 'card-wrapper')]//h2
    Set Global Variable      ${quick_pending_upload_count}    ${quick_pending_upload_count}
    Log                      ${quick_pending_upload_count}

get Pending upload creds count from list and store as global variable and validate
    Wait Until Page Ready
    Wait Until Element Is Visible                                 //span[@class='k-pager-info']
    ${list_pending_upload_count}=    Get Text                     //span[@class='k-pager-info']
    Set Global Variable        ${list_pending_upload_count}    ${list_pending_upload_count}
    Log                        ${list_pending_upload_count}
    Should Contain             ${list_pending_upload_count}    ${quick_pending_upload_count}

#Rejected
Apply Rejected quick filter
    Wait Until Page Ready
    Wait Until Element Is Visible       //*[contains(text(), 'Expiring')]               ${TIMEOUT}
    Wait Until Element Is Enabled       //*[contains(text(), 'Expiring')]                ${TIMEOUT}
    Mouse Over                          //*[contains(text(), 'Expiring')]
    Wait Until Element Is Visible       (//*[contains(text(), 'Rejected')])[1]        ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       (//*[contains(text(), 'Rejected')])[1]

get Rejected quick filter name Validate
    Wait Until Page Ready
    Wait Until Element Is Visible              (//*[contains(text(), 'Rejected')])[1]        ${TIMEOUT}
    Wait Until Page Ready
    ${Rejected_name}=    Get Text       (//*[contains(text(), 'Rejected')])[1]
    Should Be Equal        ${Rejected_name}        Rejected

get Rejected creds count from quick filter and store as global variable
    Wait Until Page Ready
    Wait Until Element Is Visible                                (//*[contains(text(), 'Rejected')])[1]/../..//h2
    ${quick_Rejected_name_count}=     Get Text                   (//*[contains(text(), 'Rejected')])[1]/../..//h2
    Set Global Variable      ${quick_Rejected_name_count}    ${quick_Rejected_name_count}
    Log                      ${quick_Rejected_name_count}

get Rejected creds count from list and store as global variable and validate
    Wait Until Page Ready
    Wait Until Element Is Visible                   //span[@class='k-pager-info']
    ${list_Rejected_count}=    Get Text             //span[@class='k-pager-info']
    Set Global Variable        ${list_Rejected_count}    ${list_Rejected_count}
    Log                        ${list_Rejected_count}
    Should Contain             ${list_Rejected_count}    ${quick_Rejected_name_count}

#expiring
Apply expiring quick filter
    Wait Until Page Ready
    Wait Until Element Is Visible       //*[contains(text(), 'Expiring')]                ${TIMEOUT}
    Wait Until Element Is Enabled       //*[contains(text(), 'Expiring')]                ${TIMEOUT}
    Mouse Over                          //*[contains(text(), 'Expiring')]
    Wait Until Element Is Visible       //*[contains(text(), 'Expiring')]                ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //*[contains(text(), 'Expiring')]

get expiring quick filter name Validate
    Wait Until Page Ready
    Wait Until Element Is Visible              //*[contains(text(), 'Expiring')]        ${TIMEOUT}
    Wait Until Page Ready
    ${Expiring_name}=    Get Text              //*[contains(text(), 'Expiring')]
    Should Be Equal        ${Expiring_name}        Expiring

get Expiring creds count from quick filter and store as global variable
    Wait Until Page Ready
    Wait Until Element Is Visible                                //*[contains(text(), 'Expiring')]/../..//h2
    ${quick_Expiring_name_count}=     Get Text                   //*[contains(text(), 'Expiring')]/../..//h2
    Set Global Variable      ${quick_Expiring_name_count}    ${quick_Expiring_name_count}
    Log                      ${quick_Expiring_name_count}

get Expiring creds count from list and store as global variable and validate
    Wait Until Page Ready
    Wait Until Element Is Visible                   //span[@class='k-pager-info']
    ${list_Expiring_count}=    Get Text             //span[@class='k-pager-info']
    Set Global Variable        ${list_Expiring_count}    ${list_Expiring_count}
    Log                        ${list_Expiring_count}
    Should Contain             ${list_Expiring_count}    ${quick_Expiring_name_count}

#validate  pending upload and sent status creds should be present
after applying pending upload quick filter validate that pending upload and sent status creds should be present in list
    Wait Until Page Ready
    Wait Until Element Is Visible       //span[text()='Credential Status']/../..//span[contains(@class,'k-i')]
    Click Element                       //span[text()='Credential Status']/../..//span[contains(@class,'k-i')]
    Wait Until Page Ready
    Wait Until Element Is Enabled          //li[@class='k-item']
    ${creds_status}=    Get WebElements    //li[@class='k-item']
    ${text_list}=    Create List

    FOR    ${element}    IN    @{creds_status}
        ${text}=    Get Text    ${element}
        Log    Found Text: ${text}
        Append To List    ${text_list}    ${text}
    END
    Log        ${text_list}
    Should Contain Any    ${text_list}    Sent    Pending Upload


#column filter for all status credentials
open column filter for credential status
    Wait Until Page Ready
    Wait Until Element Is Visible       //span[text()='Credential Status']/../..//span[contains(@class,'k-i')]
    Wait Until Page Ready
    Scroll Element Into View            //span[text()='Credential Status']/../..//span[contains(@class,'k-i')]
    Wait Until Page Ready
    Click Element                       //span[text()='Credential Status']/../..//span[contains(@class,'k-i')]
    Wait Until Page Ready

#pending upload
select pending upload column filter
    Wait Until Page Ready
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    //label[text()='Pending Upload']/..//input[@type='checkbox']    ${TIMEOUT}
    Run Keyword If    ${exists}        Scroll Element Into View    //label[text()='Pending Upload']/..//input[@type='checkbox']
    Run Keyword If    ${exists}        Click Element               //label[text()='Pending Upload']/..//input[@type='checkbox']
    Run Keyword Unless    ${exists}    Log    Pending Upload creds are not present    WARN


#pending verification
Select Pending Verification Column Filter
    Wait Until Page Ready
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    //label[text()='Pending Verification']/..//input[@type='checkbox']    ${TIMEOUT}
    Run Keyword If    ${exists}    Scroll Element Into View                     //label[text()='Pending Verification']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Click Element                                //label[text()='Pending Verification']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Wait Until Page Ready
    Run Keyword Unless    ${exists}    Log    Pending Verification creds are not present    WARN


#expired
Select Expired Column Filter
    Wait Until Page Ready
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    //label[text()='Expired']/..//input[@type='checkbox']    timeout=5s
    Run Keyword If    ${exists}    Scroll Element Into View    //label[text()='Expired']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Click Element               //label[text()='Expired']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Wait Until Page Ready
    Run Keyword Unless    ${exists}    Log    Expired creds are not present    WARN


#Rejected
Select Rejected Column Filter
    Wait Until Page Ready
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    //label[text()='Rejected']/..//input[@type='checkbox']    timeout=5s
    Run Keyword If    ${exists}    Scroll Element Into View    //label[text()='Rejected']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Click Element               //label[text()='Rejected']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Wait Until Page Ready
    Run Keyword Unless    ${exists}    Log    Rejected creds are not present    WARN


#Sent
Select Sent Column Filter
    Wait Until Page Ready
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    //label[text()='Sent']/..//input[@type='checkbox']    timeout=5s
    Run Keyword If    ${exists}    Scroll Element Into View    //label[text()='Sent']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Click Element               //label[text()='Sent']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Wait Until Page Ready
    Run Keyword Unless    ${exists}    Log    Sent creds are not present    WARN

#Verified
Select verified Column Filter
    Wait Until Page Ready
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    //label[text()='Verified']/..//input[@type='checkbox']    timeout=5s
    Run Keyword If    ${exists}    Scroll Element Into View    //label[text()='Verified']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Click Element               //label[text()='Verified']/..//input[@type='checkbox']
    Run Keyword If    ${exists}    Wait Until Page Ready
    Run Keyword Unless    ${exists}    Log    Verified creds are not present    WARN
    
#click on filter button
click on filter button
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Filter']
    Scroll Element Into View         //span[text()='Filter']
    Click Element                    //span[text()='Filter']


   
#upload credential
open upload credential window
    Wait Until Page Ready
    Wait Until Element Is Visible        (//button[@aria-label='My button'])[1]
    Scroll Element Into View             (//button[@aria-label='My button'])[1]
    Click Element                        (//button[@aria-label='My button'])[1]

upload credential file
    Wait Until Page Ready
    Sleep                                ${WAIT_TIME}
    Choose File                          //input[@type='file']        ${FILE}
    Sleep                                ${WAIT_TIME}

capture credential file name and store as variable
    Wait Until Page Ready
    Wait Until Element Is Visible        //input[@name='documentName']
    ${uploaded_cred_name}=   Get Text    //input[@name='documentName']
    Set Global Variable      ${uploaded_cred_name}    ${uploaded_cred_name}
    Log                      ${uploaded_cred_name}

open effective date calender and enter date
    Wait Until Page Ready
    Wait Until Element Is Visible         //label[text()='Effective Date']/..//button
    Scroll Element Into View              //label[text()='Effective Date']/..//button
    Click Element                         //label[text()='Effective Date']/..//button
    Wait Until Page Ready
    Wait Until Element Is Visible         //button[text()='1']
    Scroll Element Into View              //button[text()='1']
    Click Element                         //button[text()='1']
    Wait Until Page Ready

open expiration date calender and enter date
    Wait Until Page Ready
    Wait Until Element Is Visible         //label[text()='Expiration Date']/..//button
    Scroll Element Into View              //label[text()='Expiration Date']/..//button
    Click Element                         //label[text()='Expiration Date']/..//button
    Wait Until Page Ready
    Wait Until Element Is Visible         //button[text()='28']
    Scroll Element Into View              //button[text()='28']
    Click Element                         //button[text()='28']
    Wait Until Page Ready

uncheck verify checkbox
    Wait Until Page Ready
    Wait Until Element Is Visible        //label[text()='Verify Credential']/..//input
    Scroll Element Into View             //label[text()='Verify Credential']/..//input
    Click Element                        //label[text()='Verify Credential']/..//input
    
click on save button
    Wait Until Page Ready
    Wait Until Element Is Visible        //span[text()='Save']
    Scroll Element Into View             //span[text()='Save']
    Click Element                        //span[text()='Save']
    Wait Until Page Ready
    Sleep                                ${WAIT_TIME}



#open column filter window for document
click on open column filter for document
    Wait Until Page Ready
    Wait Until Element Is Visible       //span[text()='Document']/../..//span[contains(@class,'k-i')]
    Wait Until Page Ready
    Scroll Element Into View            //span[text()='Document']/../..//span[contains(@class,'k-i')]
    Click Element                       //span[text()='Document']/../..//span[contains(@class,'k-i')]

search with uploaded document name
    Wait Until Page Ready
    Input Text                        //input[@type='text']            ${uploaded_file}
    Wait Until Page Ready
    Wait Until Element Is Visible     //label[text()='Check All']/..//input
    Click Element                     //label[text()='Check All']/..//input
    Wait Until Page Ready

validate pending upload changed to pending verification status
    Wait Until Page Ready
    Sleep                                ${WAIT_TIME}
    ${status}=    Get Text    (//a[text()='resume.jpg']/../../..//div)[1]
    ${updated_status_to_pending_verification}=    Evaluate    "${status}".lower()
    Should Contain    ${updated_status_to_pending_verification}    pending verification

open pending verification credential details
    Wait Until Page Ready
    Wait Until Element Is Visible    (//span[text()='REVIEW'])[1]
    Click Element                    (//span[text()='REVIEW'])[1]
    
reject credentials with reason
    Wait Until Page Ready
    Wait Until Element Is Visible    //*[contains(text(),'REJECT')]
    Click Element                    //*[contains(text(),'REJECT')]
    Wait Until Page Ready
    Input Text                       //textarea[@name='rejectReason']    test
    Wait Until Page Ready
    Click Element                    //*[contains(text(),'Reject Document')]
    Sleep                                ${WAIT_TIME}

verify credentials
    Wait Until Page Ready
    Wait Until Element Is Visible    //*[contains(text(),'VERIFY')]
    Click Element                    //*[contains(text(),'VERIFY')]
    Sleep                                ${WAIT_TIME}

validate pending verification changed to rejected status
    Wait Until Page Ready
    Sleep                                ${WAIT_TIME}
    ${status}=    Get Text    (//a[text()='resume.jpg']/../../..//div)[1]
    ${updated_status_to_rejected}=    Evaluate    "${status}".lower()
    Log               ${updated_status_to_rejected}
    Should Contain    ${updated_status_to_rejected}    rejected


validate pending verification changed to verified status
    Wait Until Page Ready
    Sleep                                ${WAIT_TIME}
    ${status}=    Get Text    (//a[text()='resume.jpg']/../../..//div)[1]
    ${updated_status_to_verified}=    Evaluate    "${status}".lower()
    Log               ${updated_status_to_verified}
    Should Contain    ${updated_status_to_verified}    verified

after column filter validate data for verified credentials are filtered
    ${elements}=    Get WebElements    //tr//span[text()='Verified']
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        ${lower}=    Evaluate    '${text}'.strip().lower()
        Should Be Equal    ${lower}    verified
        Sleep    1
        Log    ${lower}
    END


after column filter validate data for pending upload credentials are filtered
    ${elements}=    Get WebElements    //tr//span[text()='Pending Upload']
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        ${lower}=    Evaluate    '${text}'.strip().lower()
        Should Be Equal    ${lower}    pending upload
        Sleep    1
        Log    ${lower}
    END


after column filter validate data for pending verification credentials are filtered
    ${elements}=    Get WebElements    //tr//span[text()='Pending Verification']
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        ${lower}=    Evaluate    '${text}'.strip().lower()
        Should Be Equal    ${lower}    pending verification
        Sleep    1
        Log    ${lower}
    END

after column filter validate data for Expired credentials are filtered
    ${elements}=    Get WebElements    //tr//span[text()='Expired']
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        ${lower}=    Evaluate    '${text}'.strip().lower()
        Should Be Equal    ${lower}    expired
        Sleep    1
        Log    ${lower}
    END

after column filter validate data for Rejected credentials are filtered
    ${elements}=    Get WebElements    //tr//span[text()='Rejected']
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        ${lower}=    Evaluate    '${text}'.strip().lower()
        Should Be Equal    ${lower}    rejected
        Sleep    1
        Log    ${lower}
    END

after column filter validate data for Sent credentials are filtered
    ${elements}=    Get WebElements    //tr//span[text()='Sent']
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        ${lower}=    Evaluate    '${text}'.strip().lower()
        Should Be Equal    ${lower}    sent
        Sleep    1
        Log    ${lower}
    END

#create view
click on create view open button
    Wait Until Page Ready
    Wait Until Element Is Visible      //button[@aria-label='save']      ${TIMEOUT}
    Click Element                      //button[@aria-label='save']
    Wait Until Page Ready

click on save as view button
    Wait Until Page Ready
    Click Element    //*[contains(text(),'Save As')]
    Wait Until Page Ready

enter view name
    Wait Until Page Ready
    Input Text    //input[@name='viewName']    ${view_name}\
    Log           ${view_name}
    Wait Until Page Ready

click on save view button
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[@type='submit']
    Click Element                    //button[@type='submit']
    Sleep                            ${WAIT_TIME}
    Wait Until Page Ready

validate that view is created successfully
    Wait Until Page Ready
    Wait Until Element Is Visible        //button[@aria-label='views']
    ${text}=    Get Text                 //button[@aria-label='views']
    ${newly_created_view}=    Evaluate    '${text}'.strip().lower()

    Set Global Variable      ${newly_created_view}    ${newly_created_view}
    Should Be Equal    ${newly_created_view}      ${view_name}
    Log    ${view_name}
    Log    ${newly_created_view}

go to default view
    Wait Until Page Ready
    Wait Until Element Is Visible        //button[@aria-label='views']
    Click Element                        //button[@aria-label='views']
    Wait Until Page Ready
    Sleep                                ${WAIT_TIME}
    Wait Until Element Is Visible        //span[@class='k-link k-menu-link']//*[text()='Default']
    Click Element                        //span[@class='k-link k-menu-link']//*[text()='Default']
    Wait Until Page Ready
    

#create subscription
click on create subscription open button
    Wait Until Page Ready
    Wait Until Element Is Visible      //button[@aria-label='export']  
    Click Element                      //button[@aria-label='export']
    Wait Until Page Ready

click on create subscription option
    Wait Until Page Ready
    Wait Until Element Is Visible    //*[text()='Create Subscription']
    Click Element                    //*[text()='Create Subscription']
    Sleep                            ${WAIT_TIME}
    Wait Until Page Ready

select start date in create subscription form
    Wait Until Page Ready
    Wait Until Element Is Visible    //input[@name='schedule.startDate']/..//div
    Click Element                    //input[@name='schedule.startDate']/..//div
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[@aria-label='Next month']
    Click Element                    //button[@aria-label='Next month']
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[text()='1']
    Sleep                            ${WAIT_TIME}
    Click Element                    //button[text()='1']
    Sleep                            ${WAIT_TIME}
    Wait Until Page Ready

select end date in create subscription form
    Wait Until Page Ready
    Wait Until Element Is Visible    //input[@name='schedule.endDate']/..//div
    Click Element                    //input[@name='schedule.endDate']/..//div
    Wait Until Page Ready
    Click Element                    //button[text()='28']
    Sleep                            ${WAIT_TIME}
    Wait Until Page Ready

enter time in create subscription form
    Wait Until Page Ready
    Click Element                    //button[@aria-label='Choose time']
    Wait Until Page Ready
    Sleep                            ${WAIT_TIME}
    Click Element                    //*[text()='02']
    Wait Until Page Ready
    Sleep                            ${WAIT_TIME}
    Wait Until Page Ready
    Click Element                    //li[@aria-label='10 minutes']
    Sleep                            ${WAIT_TIME}
    Wait Until Page Ready
    
open repeat dropdown and select daily in create subscription form
    Wait Until Page Ready
    Wait Until Element Is Visible    //input[@aria-controls='schedule.repeatlist']/..//button
    Click Element                    //input[@aria-controls='schedule.repeatlist']/..//button
    Wait Until Page Ready
    Wait Until Element Is Visible    //li[@id='option-schedule.repeat-0']
    Click Element                    //li[@id='option-schedule.repeat-0']
    Wait Until Page Ready

enter email subject in create subscription form
    Wait Until Page Ready
    Wait Until Element Is Visible      //input[@name='emailSubject']  
    Input Text                         //input[@name='emailSubject']    test
    Wait Until Page Ready

enter email content in create subscription form
    Wait Until Page Ready
    Wait Until Element Is Visible     //textarea[@name='emailContent']
    Input Text                        //textarea[@name='emailContent']    test subscription
    Wait Until Page Ready

click on schedule in create subscription form
    Wait Until Page Ready
    Wait Until Element Is Visible    //*[text()='Schedule']
    Click Element                    //*[text()='Schedule']
    Sleep                            ${WAIT_TIME}
    Wait Until Page Ready
   
#export csv
click on export csv option
    Wait Until Page Ready
    Click Element                   //*[text()='Export CSV']
    Wait Until Page Ready

#search text field functionality
enter credential name in search box
    Wait Until Page Ready
    Wait Until Element Is Visible        //input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Sleep                                ${WAIT_TIME}
    Input Text                           //input[@class='k-input k-input-md k-rounded-md k-input-solid']       ${uploaded_file}
    Wait Until Page Ready

validate that credential is filtered properly
    Wait Until Page Ready
    Sleep                                ${WAIT_TIME}
    ${status}=    Get Text    //a[text()='resume.jpg']
    ${filtered_credential}=    Evaluate    "${status}".lower()
    Log               ${filtered_credential}
    Log               ${uploaded_file}
    Should Contain    ${filtered_credential}    ${uploaded_file}


    
