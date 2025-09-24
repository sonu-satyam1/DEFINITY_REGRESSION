*** Settings ***
Documentation    Definity
Library          SeleniumLibrary
Library          ScreenCapLibrary
Resource         ../Resources/resource.robot
Library          OperatingSystem
Library          SikuliLibrary
Resource        ../POM/Vendor_timecards_expense.robot



*** Keywords ***
open hcs with url and login
#    Start Video Recording    alias=None    name=DemoRecording    fps=None    size_percentage=1    embed=True    embed_width=100px    monitor=1
    Create Webdriver       ${browser}
    Go To    ${url}
    Maximize Browser Window
    Sleep    ${WAIT_TIME}
    Input Text    xpath://input[@name='emailAddress']    ${username}
    Input Password    xpath://input[@name='password']    ${password}
    Click Button    xpath://button[@type='submit']
    Sleep    ${WAIT_TIME}
    
    
open hcs time cards
    Wait Until Page Contains Element    //a[@href='/timecard']    ${TIMEOUT}
    Click Element                       //a[@href='/timecard']
    Sleep    ${WAIT_TIME}

filter hcs pending approval time cards and expense
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Click Element                       //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Pending Approval']    ${TIMEOUT}
    Click Element                       //label[text()='Pending Approval']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}

filter hcs approved time cards and expense
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Click Element                       //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Approved']    ${TIMEOUT}
    Click Element                       //label[text()='Approved']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}

filter hcs timecards by dates worked
    Scroll Element Into View            //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element    //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Click Element                       //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //span[@class='k-icon k-svg-icon k-svg-i-search k-input-icon']/..//input[@type='text']         ${TIMEOUT}
    Input Text                          //span[@class='k-icon k-svg-icon k-svg-i-search k-input-icon']/..//input[@type='text']         ${dates_worked}
    Wait Until Page Contains Element    //span[@class='k-checkbox-wrap']/..//label[text()='Check All']            ${TIMEOUT}
    Click Element                       //span[@class='k-checkbox-wrap']/..//label[text()='Check All']
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']                ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                               ${WAIT_TIME}


filter hcs timecards by placement id
    Scroll Element Into View            //span[text()='Placement ID']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element    //span[text()='Placement ID']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Click Element                       //span[text()='Placement ID']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //span[@class='k-icon k-svg-icon k-svg-i-search k-input-icon']/..//input[@type='text']         ${TIMEOUT}
    Input Text                          //span[@class='k-icon k-svg-icon k-svg-i-search k-input-icon']/..//input[@type='text']         ${placement_id}
    Wait Until Page Contains Element    //span[@class='k-checkbox-wrap']/..//label[text()='Check All']            ${TIMEOUT}
    Click Element                       //span[@class='k-checkbox-wrap']/..//label[text()='Check All']
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']                ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                               ${WAIT_TIME}

select hcs timecard or expense from list
    Wait Until Page Contains Element    (//tr//td//a)[1]                       ${TIMEOUT}
    Click Element                       (//tr//td//a)[1]
    Sleep                               ${WAIT_TIME}

capture dates worked after opening timecard or expense
    Wait Until Page Contains Element    //span[@class='timecard-date']    ${TIMEOUT}
    ${actual_dates_worked}        Get Text         //span[@class='timecard-date']
    Set Suite Variable                          ${actual_dates_worked}
    Log To Console                              ${actual_dates_worked}
    

verify hcs timecard status is in pending approval
    ${EXPECTED_STATUS}=    Set Variable        Pending Approval
    Wait Until Page Contains Element           //h1[@class='post-login-heading my-0 ms-0 me-2']/..//span[text()='Pending Approval']
    ${ui_TIMECARD STATUS}    Get Text          //h1[@class='post-login-heading my-0 ms-0 me-2']/..//span[text()='Pending Approval']
    Log To Console                             ${ui_TIMECARD STATUS}
    Should Be Equal       ${ui_TIMECARD STATUS}        ${EXPECTED_STATUS}

filter hcs expense type
    Wait Until Page Contains Element    //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Click Element                       //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Expense']    ${TIMEOUT}
    Click Element                       //label[text()='Expense']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}

filter hcs timecard type
    Wait Until Page Contains Element    //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Click Element                       //span[text()='Type']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Timecard']    ${TIMEOUT}
    Click Element                       //label[text()='Timecard']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}

filter hcs expense with name
    Wait Until Page Contains Element    //span[text()='Talent']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Click Element                       //span[text()='Talent']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //input[@class='k-input-inner k-input k-input-md k-rounded-md k-input-solid']    ${TIMEOUT}
    Input Text                          //input[@class='k-input-inner k-input k-input-md k-rounded-md k-input-solid']    ${expense_talent_name}
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                        //span[text()='Filter']
    Sleep    ${WAIT_TIME}

open hcs expense name and validate status
    Wait Until Page Contains Element    (//tr//td//a)[1]    ${TIMEOUT}
    Click Element                        (//tr//td//a)[1]
    Sleep    ${WAIT_TIME}
    ${EXPECTED_STATUS}=    Set Variable        Pending Approval
    Wait Until Page Contains Element           //h1[@class='post-login-heading my-0 ms-0 me-2']/..//span[text()='Pending Approval']
    ${ui_EXPENSE STATUS}    Get Text          //h1[@class='post-login-heading my-0 ms-0 me-2']/..//span[text()='Pending Approval']
    Log To Console                             ${ui_EXPENSE STATUS}
    Should Be Equal       ${ui_EXPENSE STATUS}        ${EXPECTED_STATUS}

approve timecard from hcs side
    Wait Until Page Contains Element            //span[text()='Approve Timecard']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    Click Element                               //span[text()='Approve Timecard']
    Sleep    ${WAIT_TIME}

approve expense from hcs side
    Wait Until Page Contains Element            //span[text()='Approve Expense']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    Click Element                               //span[text()='Approve Expense']
    Sleep    ${WAIT_TIME}

capture name and amount of approved timecard
    Wait Until Page Contains Element            //h1[@class='post-login-heading my-0 ms-0 me-2']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${ui_approved_timecard_name}    Get Text    //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable                          ${ui_approved_timecard_name}
    Log To Console                              ${ui_approved_timecard_name}
    Wait Until Page Contains Element            //span[text()='Amount:']
    Scroll Element Into View                    //span[text()='Amount:']
    ${ui_approved_timecard_amount}    Get Text  //span[text()='Amount:']
    Set Suite Variable                          ${ui_approved_timecard_amount}
    Log To Console                              ${ui_approved_timecard_amount}


capture name and amount of approved expense
    Wait Until Page Contains Element            //h1[@class='post-login-heading my-0 ms-0 me-2']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${ui_approved_expense_name}    Get Text    //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable                          ${ui_approved_expense_name}
    Log To Console                              ${ui_approved_expense_name}
    Wait Until Page Contains Element            //span[text()='Amount:']
    Scroll Element Into View                    //span[text()='Amount:']
    ${ui_approved_expense_amount}    Get Text  //span[text()='Amount:']
    Set Suite Variable                          ${ui_approved_expense_amount}
    Log To Console                              ${ui_approved_expense_amount}

capture actual amount and name of approved timecard after approving timecard and validate
    Wait Until Page Contains Element            //h1[@class='post-login-heading my-0 ms-0 me-2']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${actual_approved_timecard_name}    Get Text    //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable                          ${actual_approved_timecard_name}
    Log To Console                              ${actual_approved_timecard_name}
    Wait Until Page Contains Element            //span[text()='Amount:']
    Scroll Element Into View                    //span[text()='Amount:']
    ${actual_approved_timecard_amount}    Get Text  //span[text()='Amount:']
    Set Suite Variable                          ${actual_approved_timecard_amount}
    Log To Console                              ${actual_approved_timecard_amount}
    Should Be Equal        ${actual_approved_timecard_name}        ${ui_approved_timecard_name}
    Should Be Equal        ${actual_approved_timecard_amount}      ${ui_approved_timecard_amount}

capture actual amount and name of approved expense after approving expense and validate
    Wait Until Page Contains Element            //h1[@class='post-login-heading my-0 ms-0 me-2']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${actual_approved_expense_name}    Get Text    //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable                          ${actual_approved_expense_name}
    Log To Console                              ${actual_approved_expense_name}
    Wait Until Page Contains Element            //span[text()='Amount:']
    Scroll Element Into View                    //span[text()='Amount:']
    ${actual_approved_expense_amount}    Get Text  //span[text()='Amount:']
    Set Suite Variable                          ${actual_approved_expense_amount}
    Log To Console                              ${actual_approved_expense_amount}
    Should Be Equal        ${actual_approved_expense_name}        ${ui_approved_expense_name}
    Should Be Equal        ${actual_approved_expense_amount}      ${ui_approved_expense_amount}

rescind the approved timecard in hcs side
    Wait Until Page Contains Element    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-rounded-md k-icon-button i')]    ${TIMEOUT}
    Click Element                       //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-rounded-md k-icon-button i')]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Rescind Approval']    ${TIMEOUT}
    Click Element                       //span[text()='Rescind Approval']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Continue']   ${TIMEOUT}
    Click Element                       //span[text()='Continue']
    Sleep    ${WAIT_TIME}


validate name and status of rescind timecard
    ${expected_status_after_rescind}=    Set Variable        Pending Approval
    Wait Until Page Contains Element       //h1[@class='post-login-heading my-0 ms-0 me-2']
    ${rescind_talent_name}    Get Text    //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable                    ${rescind_talent_name} 
    ${actual_status_after_rescind}        Get Text    //span[@class='status-chips-wrapper pending-approval']
    Set Suite Variable                    ${actual_status_after_rescind}      
    Should Be Equal        ${actual_status_after_rescind}        ${expected_status_after_rescind} 
    ${actual}             Convert To Lower Case    ${rescind_talent_name}
    ${expected}           Convert To Lower Case    ${ui_approved_timecard_name}
    Should Be Equal        ${actual}        ${expected}

filter hcs timecards by dates worked after approving again after rescind
    Scroll Element Into View            //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element    //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Click Element                       //span[text()='Dates Worked']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //span[@class='k-icon k-svg-icon k-svg-i-search k-input-icon']/..//input[@type='text']         ${TIMEOUT}
    Input Text                          //span[@class='k-icon k-svg-icon k-svg-i-search k-input-icon']/..//input[@type='text']         ${actual_dates_worked}
    Wait Until Page Contains Element    //span[@class='k-checkbox-wrap']/..//label[text()='Check All']            ${TIMEOUT}
    Click Element                       //span[@class='k-checkbox-wrap']/..//label[text()='Check All']
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']                ${TIMEOUT}
    Click Element                       //span[text()='Filter']
    Sleep                               ${WAIT_TIME}
filter hcs timecard with name after approving again after rescind
    Sleep    2s
    Scroll Element Into View             //span[text()='Talent']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep                               ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Talent']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Click Element                       //span[text()='Talent']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //input[@class='k-input-inner k-input k-input-md k-rounded-md k-input-solid']    ${TIMEOUT}
    Input Text                          //input[@class='k-input-inner k-input k-input-md k-rounded-md k-input-solid']    	${ui_approved_timecard_name}
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Check All']/..//input[@class='k-checkbox k-checkbox-md k-rounded-md']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    Click Element                        //label[text()='Check All']/..//input[@class='k-checkbox k-checkbox-md k-rounded-md']
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element                        //span[text()='Filter']
    Sleep    ${WAIT_TIME}

edit and approve timecard again after rescind
    Wait Until Page Contains Element    //span[text()='EDIT']    ${TIMEOUT}
    Sleep            ${WAIT_TIME}
    Click Element                       //span[text()='EDIT']
    Wait Until Page Contains Element    //span[text()=' APPROVE WITH EDITS']    ${TIMEOUT}
    Sleep            ${WAIT_TIME}
    Click Element                      //span[text()=' APPROVE WITH EDITS']
    Sleep                              ${WAIT_TIME}

validate name and status of rescind timecard after approving again after rescind
    Sleep                              ${WAIT_TIME}
    ${expected_status_after_rescind_again_approve}=    Set Variable        Approved
    Wait Until Page Contains Element       //h1[@class='post-login-heading my-0 ms-0 me-2']
    ${rescind_talent_name_again_approve}    Get Text    //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable                    ${rescind_talent_name_again_approve}
    ${actual_status_after_rescind_again_approve}        Get Text    //span[@class='status-chips-wrapper active']
    Set Suite Variable                    ${actual_status_after_rescind_again_approve}
    Should Be Equal        ${actual_status_after_rescind_again_approve}        ${expected_status_after_rescind_again_approve}
    ${actual}             Convert To Lower Case    ${rescind_talent_name_again_approve}
    ${expected}           Convert To Lower Case    ${ui_approved_timecard_name}
    Should Be Equal        ${actual}        ${expected}



      





    
    





    



     