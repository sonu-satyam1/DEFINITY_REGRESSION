*** Settings ***
Documentation    Definity
Library          SeleniumLibrary
Library          ScreenCapLibrary
Resource         ../Resources/resource.robot
Library          OperatingSystem


*** Keywords ***
#submitting time cards##################################################################
open time cards
    Wait Until Page Contains Element    //a[@href='/timecard']    ${TIMEOUT}
    Click Element    //a[@href='/timecard']
    Sleep    ${WAIT_TIME}
filter pending submission time cards
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']    ${TIMEOUT}
    Click Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Pending Submission']    ${TIMEOUT}
    Click Element        //label[text()='Pending Submission']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}
enter time in and time out
    Wait Until Page Contains Element    (//td//a)[1]    ${TIMEOUT}
    Click Element    (//td//a)[1]
    Sleep    ${WAIT_TIME}
    Scroll Element Into View    (//label[text()='Time In']/../..//button)[1]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//label[text()='Time In']/../..//button)[1]     ${TIMEOUT}
    Click Element    (//label[text()='Time In']/../..//button)[1]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//li[text()='02'])[1]    ${TIMEOUT}
    Click Element    (//li[text()='02'])[1]
    Sleep    ${WAIT_TIME}    
    Wait Until Page Contains Element    (//li[text()='00'])[2]    ${TIMEOUT}
    Click Element    (//li[text()='00'])[2] 
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//label[text()='Time Out']/../..//button)[1]    ${TIMEOUT}
    Click Element    (//label[text()='Time Out']/../..//button)[1]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//li[text()='04'])[1]     ${TIMEOUT}
    Click Element    (//li[text()='04'])[1]
    Wait Until Page Contains Element    (//li[text()='00'])[2]       ${TIMEOUT}
    Sleep    ${WAIT_TIME}
open add document section
    Wait Until Page Contains Element    //button[@class='k-button k-button-md k-button-rectangle k-button-solid k-button-solid-primary k-rounded-md pr-btn-primary']    ${TIMEOUT}
    Click Element    //button[@class='k-button k-button-md k-button-rectangle k-button-solid k-button-solid-primary k-rounded-md pr-btn-primary']
    Sleep    ${WAIT_TIME}
    Click Element    //button[@class='k-button k-button-md k-button-rectangle k-button-solid k-button-solid-primary k-rounded-md pr-btn-primary']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //div[contains(@class,'k-button k-button')]    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
upload file and save
    Input Text      //input[@type='file']    ${FILE}
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //button//span[text()='Save']    ${TIMEOUT}
    Click Element    //button//span[text()='Save']
    Wait Until Element Is Not Visible      //button//span[text()='Save']      ${TIMEOUT}
    Sleep    ${WAIT_TIME}
approve the time card
    Wait Until Page Contains Element    //button//span[text()=' APPROVE WITH EDITS']    ${TIMEOUT}
    Click Element        //button//span[text()=' APPROVE WITH EDITS']
    Sleep    ${WAIT_TIME}
    
#expesne addition#########################################################################
open add expense page
    Wait Until Page Contains Element    //button//span[text()='ADD NEW EXPENSE']        ${TIMEOUT}
    Click Element    //button//span[text()='ADD NEW EXPENSE']
    Sleep    ${WAIT_TIME}
select talent from dropdown
    Wait Until Page Contains Element    (//input[@class='k-input-inner'])[2]    ${TIMEOUT}
    Click Element    (//input[@class='k-input-inner'])[2]
    Sleep       ${WAIT_TIME} 
    Wait Until Page Contains Element    (//div[@class='position-relative']//button)[1]      ${TIMEOUT}
    Click Element    (//div[@class='position-relative']//button)[1]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//div[@class='k-list-content k-virtual-content'])[1]    ${TIMEOUT}
    Click Element    (//div[@class='k-list-content k-virtual-content'])[1]
    Sleep    ${WAIT_TIME}


select job from dropdown
    Wait Until Page Contains Element      (//input[@class='k-input-inner'])[3]        ${TIMEOUT}
    Click Element    (//input[@class='k-input-inner'])[3]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//div[@class='position-relative']//button)[2]    ${TIMEOUT}
    Click Element    (//div[@class='position-relative']//button)[2]
    Sleep    ${WAIT_TIME}

    Wait Until Page Contains Element    (//div[@class='k-list-content k-virtual-content']//li)[1]    ${TIMEOUT}
    Click Element    (//div[@class='k-list-content k-virtual-content']//li)[1]
    Sleep    ${WAIT_TIME}
    
    
lands to fill expense form
    Wait Until Page Contains Element    //button//span[text()='Continue']    ${TIMEOUT}
    Click Element    //button//span[text()='Continue']
    Sleep     ${WAIT_TIME}

fill the expense form
    Scroll Element Into View    //div[@class='label-hidden w-112 m-0']
    Wait Until Page Contains Element    //div[@class='label-hidden w-112 m-0']    ${TIMEOUT}
    Click Element    //div[@class='label-hidden w-112 m-0']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[@class='k-floating-label-container k-focus k-empty']//button    ${TIMEOUT}
    Click Element    //span[@class='k-floating-label-container k-focus k-empty']//button
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//div[@class='k-list k-list-md']//li)[1]    ${TIMEOUT}
    Click Element    (//div[@class='k-list k-list-md']//li)[1]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //div[@class='position-relative']//input[@class='k-input k-input-md k-rounded-md k-input-solid']    ${TIMEOUT}
    Click Element    //div[@class='position-relative']//input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Sleep    ${WAIT_TIME}
    Input Text    //div[@class='position-relative']//input[@class='k-input k-input-md k-rounded-md k-input-solid']    bills
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //button[@aria-label='Increase value']    ${TIMEOUT}
    Click Element    //button[@aria-label='Increase value']
    Sleep    ${WAIT_TIME}
    
open upload document section for expense
    Sleep    ${WAIT_TIME}
    Scroll Element Into View    //button[@class='icon-upload-file btn-common ms-2 me-0']
    Execute Javascript    window.scrollTo(1315, 531)
    Sleep    10
    Wait Until Page Contains Element    //button[@class='icon-upload-file btn-common ms-2 me-0']    ${TIMEOUT}
    Sleep    10
    Click Element    //button[@class='icon-upload-file btn-common ms-2 me-0']
    Sleep    ${WAIT_TIME}

upload document for expense
    Wait Until Page Contains Element    //input[@type='file']    ${TIMEOUT}
    Input Text    //input[@type='file']    ${FILE}
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Save']    ${TIMEOUT}
    Click Element    //span[text()='Save']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Submit Expense']    ${TIMEOUT}
    Click Element    //span[text()='Submit Expense']

filter pending approval timecard and expense
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']    ${TIMEOUT}
    Click Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Pending Approval']    ${TIMEOUT}
    Click Element        //label[text()='Pending Approval']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}


filter approved status timecard and expense
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']    ${TIMEOUT}
    Click Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Approved']    ${TIMEOUT}
    Click Element        //label[text()='Approved']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}


filter expense type
    Wait Until Page Contains Element    //span[text()='Type']/../..//span[@class='k-icon k-i-more-vertical']    ${TIMEOUT}
    Click Element    //span[text()='Type']/../..//span[@class='k-icon k-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Expense']    ${TIMEOUT}
    Click Element    //label[text()='Expense']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}
    
filter timacard type
    Wait Until Page Contains Element    //span[text()='Type']/../..//span[@class='k-icon k-i-more-vertical']    ${TIMEOUT}
    Click Element    //span[text()='Type']/../..//span[@class='k-icon k-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Timecard']    ${TIMEOUT}
    Click Element    //label[text()='Timecard']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}


select timecard or expense from list
#    Wait Until Location Contains    (//tr//td//a)[1]       ${TIMEOUT}
    Click Element    (//tr//td//a)[1]
    Sleep    ${WAIT_TIME}

click approve timecard button
    Wait Until Page Contains Element    //button[contains(@class,'k-button k-button-md k-button-rectangle k-button-solid k-button-solid-primary k-rounded-md pr-btn-primary ')]    ${TIMEOUT}
    Click Element     //span[text()='Approve Timecard']
    Sleep    ${WAIT_TIME}
    
click approve expense button
    Wait Until Page Contains Element    //button[contains(@class,'k-button k-button-md k-button-rectangle k-button-solid k-button-solid-primary k-rounded-md pr-b')]     ${TIMEOUT}
    Click Element    //span[text()='Approve Expense']
    Sleep    ${WAIT_TIME}

edit timecard for rescind and continue again edit and approve
    Wait Until Page Contains Element    //button[@aria-label='undefined dropdownbutton']    ${TIMEOUT}
    Click Element    //button[@aria-label='undefined dropdownbutton']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //div[contains(@class,'k-popup k')]    ${TIMEOUT}
    Click Element        //div[contains(@class,'k-popup k')]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //button[contains(@class,'k-button k-button-md k-button-rectangle k-button-p')]    ${TIMEOUT}
    Click Element    //button[contains(@class,'k-button k-button-md k-button-rectangle k-button-p')]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='EDIT']       ${TIMEOUT}
    Click Element    //span[text()='EDIT']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()=' APPROVE WITH EDITS']    ${TIMEOUT}
    Click Element    //span[text()=' APPROVE WITH EDITS']
    Sleep    ${WAIT_TIME}






             
