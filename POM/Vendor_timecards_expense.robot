*** Settings ***
Documentation    Definity
Library          SeleniumLibrary
Library          ScreenCapLibrary
Resource         ../Resources/resource.robot
Library          OperatingSystem
Library          SikuliLibrary


*** Keywords ***
#open vendor portal and login
#    Create Webdriver       ${browser}
#    Delete All Cookies
#    Go To    ${vendor_url}
#    Maximize Browser Window
#    Sleep    ${WAIT_TIME}
#    Input Text    xpath://input[@name='emailAddress']    ${vendor_username}
#    Input Password    xpath://input[@name='password']    ${vendor_pwd}
#    Click Button    xpath://button[@type='submit']
#    Sleep    ${WAIT_TIME}

go to timecards and expense section
    Wait Until Page Contains Element    //span[@class='icon-time-card nav-icon mb-1']    ${TIMEOUT}
    Mouse Over     //span[@class='icon-time-card nav-icon mb-1']
    Sleep    ${WAIT_TIME}
    Click Element        //span[@class='icon-time-card nav-icon mb-1']
    Sleep    ${WAIT_TIME}

filter pending submission status timecrds and expense
    Wait Until Page Contains Element     //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //label[text()='Pending Submission']        ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //label[text()='Pending Submission']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}

filter pending approval status timecrds and expense
    Wait Until Page Contains Element     //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //label[text()='Pending Approval']        ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //label[text()='Pending Approval']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}

filter approved status timecrds and expense
    Wait Until Page Contains Element     //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Scroll Element Into View             //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //label[text()='Approved']        ${TIMEOUT}
    Scroll Element Into View             //label[text()='Approved']
    Sleep                                ${WAIT_TIME}
    Click Element                        //label[text()='Approved']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}

filter timecard on basis of dates worked
    Scroll Element Into View             //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //input[@type='text']     ${TIMEOUT}
    Input Text                           //input[@type='text']     ${dates_worked}
    Sleep                                ${WAIT_TIME}
    Click Element                        (//span[@class='k-checkbox-wrap'])[2]
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}

filter expense based on name
    Scroll Element Into View             //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //input[@type='text']     ${TIMEOUT}
    Input Text                           //input[@type='text']     ${expense_talent_name}
    Sleep                                ${WAIT_TIME}
    Click Element                        (//span[@class='k-checkbox-wrap'])[2]
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}

filter timecard on basis of talent added for expense
    Scroll Element Into View             //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //input[@type='text']     ${TIMEOUT}
    Input Text                           //input[@type='text']     ${dates_worked}
    Sleep                                ${WAIT_TIME}
    Click Element                        (//span[@class='k-checkbox-wrap'])[2]
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}


filter timecards
    Wait Until Page Contains Element    //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Scroll Element Into View            //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Click Element                       //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Timecard']     ${TIMEOUT}
    Sleep                               ${WAIT_TIME}
    Click Element                       //label[text()='Timecard']
    Wait Until Page Contains Element    //span[text()='Filter']        ${TIMEOUT}
    Sleep                               ${WAIT_TIME}
    Click Element                       //span[text()='Filter']


filter expense
    Wait Until Page Contains Element    //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Scroll Element Into View            //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Click Element                       //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Expense']     ${TIMEOUT}
    Sleep                               ${WAIT_TIME}
    Click Element                       //label[text()='Expense']
    Wait Until Page Contains Element    //span[text()='Filter']        ${TIMEOUT}
    Sleep                               ${WAIT_TIME}
    Click Element                       //span[text()='Filter']

#go to last page of the timecards
#    TRY
#        Wait Until Page Contains Element    //button[@title='Go to the last page']        ${TIMEOUT}
#        Scroll Element Into View            //button[@title='Go to the last page']
#        Click Element                       //button[@title='Go to the last page']
#        Sleep                               ${WAIT_TIME}
#    EXCEPT
#        Scroll Element Into View            (//tr//td//a)[1]

Go To Last Page Of The Timecards
    TRY
        Wait Until Page Contains Element    //button[@title='Go to the last page']    ${TIMEOUT}
        Scroll Element Into View            //button[@title='Go to the last page']
        Click Element                       //button[@title='Go to the last page']
        Sleep                               ${WAIT_TIME}
    EXCEPT    AS    ${error}
        Log    Primary action failed: ${error}
        Run Keyword And Ignore Error    Wait Until Page Contains Element    //button[@title='Go to the last page']    ${TIMEOUT}
        ${is_present}=    Run Keyword And Return Status    Page Should Contain Element    //button[@title='Go to the last page']
        IF    ${is_present}
            Scroll Element Into View        //button[@title='Go to the last page']
            Click Element                   //button[@title='Go to the last page']
        ELSE
            Scroll Element Into View        (//tr//td//a)[1]
        END
        Sleep                               ${WAIT_TIME}
    END


select first item from the last page and capture placement id                     
    Scroll Element Into View            (//tr//td//a)[1]
    Wait Until Page Contains Element    (//tr//td//a)[2]                              ${TIMEOUT}
    ${placement_id}    Get Text         (//tr//td//a)[2]
    Set Suite Variable    ${placement_id}
    Log To Console        ${placement_id}
    Wait Until Page Contains Element   (//tr//td//a)[1]                               ${TIMEOUT}
    Click Element                      (//tr//td//a)[1]
    Sleep                              ${WAIT_TIME}

capture dates worked for first item of the last page
    Wait Until Page Contains Element    (//tr//td//a)[1]/../..//td[@aria-colindex='7']
    ${dates_worked}    Get Text         (//tr//td//a)[1]/../..//td[@aria-colindex='7']
    Set Suite Variable    ${dates_worked}
    Log To Console                      ${dates_worked}

fill the timecard time in
    Scroll Element Into View            (//label[text()='Time In']/../..//button)[1]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//label[text()='Time In']/../..//button)[1]     ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    Click Element                       (//label[text()='Time In']/../..//button)[1]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//li[text()='02'])[1]    ${TIMEOUT}
    Click Element                       (//li[text()='02'])[1]
    Sleep    ${WAIT_TIME}    
    Wait Until Page Contains Element    //button[text()='OK']    ${TIMEOUT}
    Click Element    //button[text()='OK']
    Sleep    ${WAIT_TIME}

fill the timeout
    Wait Until Page Contains Element    (//label[text()='Time Out']/../..//button)[1]    ${TIMEOUT}
    Click Element                       (//label[text()='Time Out']/../..//button)[1]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//li[text()='04'])[1]     ${TIMEOUT}
    Click Element                       (//li[text()='04'])[1]
    Wait Until Page Contains Element    //button[text()='OK']      ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    Click Element                       //button[text()='OK']

open add document section
    Wait Until Page Contains Element    //span[text()='ADD DOCUMENT']    ${TIMEOUT}
    Click Element                       //span[text()='ADD DOCUMENT']
    Sleep    ${WAIT_TIME}
    
upload document and save
    Wait Until Page Contains Element    //div[@class='k-upload-button-wrap']    ${TIMEOUT}
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //input[@type='file']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    # Upload the file
    Choose File                        //input[@type='file']        ${FILE}
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //button//span[text()='Save']    ${TIMEOUT}
    Click Element                       //button//span[text()='Save']
    Sleep    ${WAIT_TIME}
    Sleep    30s

submit timecard
    Wait Until Page Contains Element    //span[text()='Submit Timecard']    ${TIMEOUT}
    Click Element                       //span[text()='Submit Timecard']
    Sleep    ${WAIT_TIME}


validate on vendor side whether the timecard have correct dates worked
    ${EXPECTED}=    Set Variable        Pending Approval
    Wait Until Page Contains Element    (//tr//td//a)[1]            ${TIMEOUT}
    Sleep                               ${WAIT_TIME}
    Click Element                       (//tr//td//a)[1]
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Pending Approval']    ${TIMEOUT}
    ${ui_timecard_status}    Get Text   //span[text()='Pending Approval']
    Log To Console        ${ui_timecard_status}
    Should Be Equal       ${ui_timecard_status}    ${EXPECTED}

open add expense vendor side
    Wait Until Page Contains Element    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md p')]        ${TIMEOUT}
    Click Element                       //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md p')]
    Sleep                               ${WAIT_TIME}

select organization from the list in vendor side
    Wait Until Page Contains Element    //label[text()='Organization']/..//button[contains(@class,'k-button')]        ${TIMEOUT}
    Click Element                       //label[text()='Organization']/..//button[contains(@class,'k-button')]
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    (//li[@class='k-list-item'])[1]                ${TIMEOUT}
    Click Element                       (//li[@class='k-list-item'])[1]
    Sleep                               ${WAIT_TIME}

select talent from the list in vendor side
    Wait Until Page Contains Element    (//button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-icon-button k-input-button')])[3]    ${TIMEOUT}
    Click Element                       (//button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-icon-button k-input-button')])[3]
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element    (//li[@class='k-list-item'])[1]        ${TIMEOUT}
    ${expense_talent_name}        Get Text        (//li[@class='k-list-item'])[1]
    Set Suite Variable                  ${expense_talent_name}
    Log To Console                      ${expense_talent_name}
    Click Element                       (//li[@class='k-list-item'])[1]
    Sleep                               ${WAIT_TIME}

select jobs from list in vendor side and continue
    Wait Until Page Contains Element    (//button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-icon-button k-input-button')])[4]    ${TIMEOUT}
    Click Element                       (//button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-icon-button k-input-button')])[4]
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    (//li[@class='k-list-item'])[1]        ${TIMEOUT}
    Click Element                       (//li[@class='k-list-item'])[1]
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //button[@class='k-button k-button-md k-rounded-md pr-btn-primary ms-3']      ${TIMEOUT}
    Click Element                       //button[@class='k-button k-button-md k-rounded-md pr-btn-primary ms-3']
    Sleep                               ${WAIT_TIME}

enter type and description in expense form
    ${my_text}=      Set Variable        travel
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     (//input[@class='k-input-inner'])[2]        ${TIMEOUT}
    Scroll Element Into View             (//input[@class='k-input-inner'])[2]
    Click Element                        (//input[@class='k-input-inner'])[2]
    Sleep                                ${WAIT_TIME}
    Input Text                           (//input[@class='k-input-inner'])[2]      ${my_text}
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //li[@class='k-list-item k-focus']        ${TIMEOUT}
    Click Element                        //li[@class='k-list-item k-focus']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     (//input[@class='k-input k-input-md k-rounded-md k-input-solid'])[2]        ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Input Text                           (//input[@class='k-input k-input-md k-rounded-md k-input-solid'])[2]        ${my_text}
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //button[@title='Increase value']            ${TIMEOUT}
    Scroll Element Into View             //button[@title='Increase value']
    Sleep                                ${WAIT_TIME}
    Click Element                        //button[@title='Increase value']
    Sleep                                ${WAIT_TIME}
    Click Element                        //button[@title='Increase value']
    Sleep                                ${WAIT_TIME}
    Click Element                        //button[@title='Increase value']
    Sleep                                ${WAIT_TIME}
    Click Element                        //button[@title='Increase value']
    Sleep                                ${WAIT_TIME}
    Click Element                        //button[@title='Increase value']
    
upload document for expense in vendor side
    Wait Until Page Contains Element    //button[@class='icon-upload-file btn-common ms-2 me-0']    ${TIMEOUT}
    Sleep                               ${WAIT_TIME}
    Scroll Element Into View            //button[@class='icon-upload-file btn-common ms-2 me-0']
    Click Element                       //button[@class='icon-upload-file btn-common ms-2 me-0']
    Wait Until Page Contains Element    //input[@type='file']        ${TIMEOUT}
    Choose File                         //input[@type='file']        ${FILE}
    Wait Until Page Contains Element    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md pr-btn-primary ms-3')]        ${TIMEOUT}
    Click Element                       //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md pr-btn-primary ms-3')]
    Sleep    45s
    
submit the expense
    Wait Until Page Contains Element    //span[text()='Submit EXPENSE']        ${TIMEOUT}
    Sleep                               ${WAIT_TIME}
    Wait Until Element Is Enabled       //span[text()='Submit EXPENSE']        ${TIMEOUT}
    Click Element                       //span[text()='Submit EXPENSE']
    Sleep                               ${TIMEOUT}

select first expense from the list and validate name
    Scroll Element Into View            (//tr//td//a)[1]
    Wait Until Page Contains Element    (//tr//td//a)[1]                              ${TIMEOUT}
    ${actual_talent_name}    Get Text         (//tr//td//a)[1]
    Set Suite Variable    ${actual_talent_name}
    Log To Console        ${actual_talent_name}
    Sleep                              ${WAIT_TIME}
    Should Be Equal        ${actual_talent_name}       ${expense_talent_name}


filter approved timecard based on name in vendor side
    Scroll Element Into View             //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //input[@type='text']     ${TIMEOUT}
    Input Text                           //input[@type='text']     ${ui_approved_timecard_name}
    Sleep                                ${WAIT_TIME}
    Click Element                        (//span[@class='k-checkbox-wrap'])[2]
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}

filter pending approval timecard based on name in vendor side
    Scroll Element Into View             //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //input[@type='text']     ${TIMEOUT}
    Input Text                           //input[@type='text']     ${ui_approved_timecard_name}
    Sleep                                ${WAIT_TIME}
    Click Element                        (//span[@class='k-checkbox-wrap'])[2]
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}

filter approved expense based on name in vendor side
    Scroll Element Into View             //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Talent Name']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //input[@type='text']     ${TIMEOUT}
    Input Text                           //input[@type='text']     ${ui_approved_expense_name}
    Sleep                                ${WAIT_TIME}
    Click Element                        (//span[@class='k-checkbox-wrap'])[2]
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}

filter approved timecard or expense on basis of date worked in vendor side
    Scroll Element Into View             //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //input[@type='text']     ${TIMEOUT}
    Input Text                           //input[@type='text']     ${actual_dates_worked}
    Sleep                                ${WAIT_TIME}
    Click Element                        (//span[@class='k-checkbox-wrap'])[2]
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}
filter pending approval timecard or expense on basis of date worked in vendor side
    Scroll Element Into View             //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element     //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']       ${TIMEOUT}
    Sleep                                ${WAIT_TIME}
    Click Element                        //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element     //input[@type='text']     ${TIMEOUT}
    Input Text                           //input[@type='text']     ${actual_dates_worked}
    Sleep                                ${WAIT_TIME}
    Click Element                        (//span[@class='k-checkbox-wrap'])[2]
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                                ${WAIT_TIME}

select timecard or expense from list in vendor side
    Scroll Element Into View            (//tr//td//a)[1]
    Wait Until Page Contains Element    (//tr//td//a)[1]                              ${TIMEOUT}
    Click Element                       (//tr//td//a)[1]


validate name and dates worked of approved expense in vendor side
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element    //h1[@class='post-login-heading my-0 ms-0 me-2']
    Scroll Element Into View            //h1[@class='post-login-heading my-0 ms-0 me-2']
    ${approved_talent_name_approved_expense}    Get Text         //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable    ${approved_talent_name_approved_expense}
    Log To Console        ${approved_talent_name_approved_expense}
    ${actual}             Convert To Lower Case    ${ui_approved_expense_name}
    ${expected}           Convert To Lower Case    ${approved_talent_name_approved_expense}
    Should Be Equal       ${actual}    ${expected}

    Wait Until Page Contains Element    //span[@class='timecard-date']
    Scroll Element Into View            //span[@class='timecard-date']
    ${approved_talent_name_approved_dates_worked}    Get Text         //span[@class='timecard-date']
    Set Suite Variable    ${approved_talent_name_approved_dates_worked}
    Log To Console        ${approved_talent_name_approved_dates_worked}
    Should Be Equal       ${approved_talent_name_approved_dates_worked}    ${actual_dates_worked}

validate name and dates worked of approved timecard in vendor side
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element    //h1[@class='post-login-heading my-0 ms-0 me-2']
    Scroll Element Into View            //h1[@class='post-login-heading my-0 ms-0 me-2']
    ${talent_name_approved_timecard}    Get Text         //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable    ${talent_name_approved_timecard}
    Log To Console        ${talent_name_approved_timecard}
    ${actual}             Convert To Lower Case    ${ui_approved_timecard_name}
    ${expected}           Convert To Lower Case    ${talent_name_approved_timecard}
    Should Be Equal       ${actual}    ${expected}

    Wait Until Page Contains Element    //span[@class='timecard-date']
    Scroll Element Into View            //span[@class='timecard-date']
    ${talent_name_approved_dates_worked}    Get Text         //span[@class='timecard-date']
    Set Suite Variable    ${talent_name_approved_dates_worked}
    Log To Console        ${talent_name_approved_dates_worked}
    Should Be Equal       ${talent_name_approved_dates_worked}    ${actual_dates_worked}

validate name and dates worked of pending approval timecard in vendor side
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element    //h1[@class='post-login-heading my-0 ms-0 me-2']
    Scroll Element Into View            //h1[@class='post-login-heading my-0 ms-0 me-2']
    ${talent_name_pending_approval_timecard}    Get Text         //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable    ${talent_name_pending_approval_timecard}
    Log To Console        ${talent_name_pending_approval_timecard}
    ${actual}             Convert To Lower Case    ${ui_approved_timecard_name}
    ${expected}           Convert To Lower Case    ${talent_name_pending_approval_timecard}
    Should Be Equal       ${actual}    ${expected}

    Wait Until Page Contains Element    //span[@class='timecard-date']
    Scroll Element Into View            //span[@class='timecard-date']
    ${talent_name_pending_approval_dates_worked}    Get Text         //span[@class='timecard-date']
    Set Suite Variable    ${talent_name_pending_approval_dates_worked}
    Log To Console        ${talent_name_pending_approval_dates_worked}
    Should Be Equal       ${talent_name_pending_approval_dates_worked}    ${actual_dates_worked}

    
    

    



    