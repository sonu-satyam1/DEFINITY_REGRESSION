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
Library         DateTime
Library        String

*** Keywords ***

click on add shift option on gwm dashboard page
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Add shift']    ${TIMEOUT}
    Click Element                    //span[text()='Add shift']
    Wait Until Page Ready

click on add shift option on gwm schedules page
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Add Shift']    ${TIMEOUT}
    Click Element                    //span[text()='Add Shift']
    Wait Until Page Ready

click on add shift option on gwm schedule details page
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Add Shift']    ${TIMEOUT}
    Click Element                    //span[text()='Add Shift']
    Wait Until Page Ready


open schedule details page
    Wait Until Page Ready
    Wait Until Element Is Visible    (//span[@class='name-col'])[1]
    Scroll Element Into View         (//span[@class='name-col'])[1]
    Click Element                    (//span[@class='name-col'])[1]
    Wait Until Page Ready

open location/dept dropdown on add shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    //label[text()='Location / Dept']/..//button    ${TIMEOUT}
    Click Element                    //label[text()='Location / Dept']/..//button
    Wait Until Page Ready


select location/dept from dropdown on add shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    (//span[@class='k-list-item-text'])[1]            ${TIMEOUT}
    Click Element                    (//span[@class='k-list-item-text'])[1]
    Wait Until Page Ready
    
open skills dropdown on add shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    //label[text()='Skill']/..//button                ${TIMEOUT}
    Click Element                    //label[text()='Skill']/..//button
    Wait Until Page Ready

select skills from dropdown on add shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    (//span[@class='k-list-item-text'])[1]                ${TIMEOUT}
    Click Element                    (//span[@class='k-list-item-text'])[1]
    Wait Until Page Ready

open work type dropdown on add shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    //label[text()='Work Type']/..//button                ${TIMEOUT}
    Click Element                    //label[text()='Work Type']/..//button
    Wait Until Page Ready

select work type from dropdown on add shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    (//span[@class='k-list-item-text'])[1]                ${TIMEOUT}
    Click Element                    (//span[@class='k-list-item-text'])[1]
    Wait Until Page Ready

open shift dropdown on add shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    //label[text()='Shift']/..//button                ${TIMEOUT}
    Click Element                    //label[text()='Shift']/..//button
    Wait Until Page Ready

select shift from dropdown on add shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    (//span[@class='k-list-item-text'])[1]                ${TIMEOUT}
    Click Element                    (//span[@class='k-list-item-text'])[1]
    Wait Until Page Ready

select date from calender
    Wait Until Page Ready
    Wait Until Element Is Visible    (//div[@class='mbsc-calendar-cell mbsc-flex-1-0-0 mbsc-calendar-day mbsc-ios mbsc-ltr'])[54]                ${TIMEOUT}
    Click Element                    (//div[@class='mbsc-calendar-cell mbsc-flex-1-0-0 mbsc-calendar-day mbsc-ios mbsc-ltr'])[54]
    Wait Until Page Ready

click on add shift button
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md pr-b')]//span[text()='Add Shift']    ${TIMEOUT}
    Scroll Element Into View         //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md pr-b')]//span[text()='Add Shift']
    Click Element                    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md pr-b')]//span[text()='Add Shift']
    Wait Until Page Ready


click on add shift button on schedule details page
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md pr-b')]//span[text()='Add Shift']    ${TIMEOUT}
    Scroll Element Into View         //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md pr-b')]//span[text()='Add Shift']
    Click Element                    (//button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-primary k-rounded-md pr-b')]//span[text()='Add Shift'])[2]
    Wait Until Page Ready
    
double tap on schedule details page
    Wait Until Page Ready
    Wait Until Element Is Visible    (//div[@class='mbsc-timeline-events'])[1]    ${TIMEOUT}
    Scroll Element Into View         (//div[@class='mbsc-timeline-events'])[1]
    Double Click Element             (//div[@class='mbsc-timeline-events'])[1]
    Wait Until Page Ready
    
click on create schedule shifts radio button
    Wait Until Page Ready
    Wait Until Element Is Visible    //label[text()='Schedule Shift(s)']    ${TIMEOUT}
    Click Element                    //label[text()='Schedule Shift(s)']
    Wait Until Page Ready


Select Location And Talent Until Option Appears On Add Scheduled Shift Window
    ${index}=    Set Variable    1

    WHILE    True
        Log    Trying index: ${index}

        # Step 1: Click Location / Dept and select the [index] item
        Wait Until Page Ready
        Click Element    //label[text()='Location / Dept']/..//button
        Wait Until Element Is Visible    (//span[@class='k-list-item-text'])[${index}]    ${TIMEOUT}
        Scroll Element Into View         (//span[@class='k-list-item-text'])[${index}]
        Click Element    (//span[@class='k-list-item-text'])[${index}]
        Wait Until Page Ready

        # Step 2: Click on Talent dropdown
        Sleep            1s
        Click Element    //label[text()='Talent']/..//button
        Wait Until Page Ready

        # Step 3: Check if the desired Talent option is available
        ${found}=    Run Keyword And Return Status    Element Should Be Visible    //li[@id='option-talent-0']    ${TIMEOUT}
        Run Keyword If    '${found}' == 'True'    Scroll Element Into View        //li[@id='option-talent-0']
        Run Keyword If    '${found}' == 'True'    Click Element    //li[@id='option-talent-0']
        Run Keyword If    '${found}' == 'True'    Exit For Loop

        # Not found → Try next index
        ${index}=    Evaluate    ${index} + 1
        Sleep        1s
        Wait Until Page Ready
    END

go to next page on calender on add shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[@aria-label='Next page']    ${TIMEOUT}
    Click Element                    //button[@aria-label='Next page']
    Wait Until Page Ready

select talent while adding schedule shift on schedule view
    Wait Until Page Ready
    Wait Until Element Is Visible     //label[text()='Talent']/..//button    ${TIMEOUT}
    Click Element                     //label[text()='Talent']/..//button
    Wait Until Page Ready
    Wait Until Element Is Visible    //li[@id='option-talent-0']            ${TIMEOUT}
    Click Element                    //li[@id='option-talent-0']
    Wait Until Page Ready
    
enable private toggle on create shift window
    Wait Until Page Ready
    Wait Until Element Is Visible       //label[text()='Private']
    Click Element                       //span[@class='k-switch-thumb k-rounded-full']
    Wait Until Page Ready



go to manage open shifts on schedules page
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Manage Open Shifts']
    Click Element                    //span[text()='Manage Open Shifts']
    Wait Until Page Ready
    
open shift date dropdown and select next 30days
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[@aria-label='Shift Date']//button
    Click Element                    //span[@aria-label='Shift Date']//button
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Next 30 Days']
    Click Element                    //span[text()='Next 30 Days']
    Wait Until Page Ready
    Scroll Element Into View         //span[text()='Apply']
    Click Element                    //span[text()='Apply']
    Wait Until Page Ready



open visibility filter and filter private shifts
    Wait Until Page Ready
    Scroll Element Into View         //span[text()='Visibility']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Visibility']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Click Element                    //span[text()='Visibility']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Ready
    Wait Until Element Is Visible    //label[text()='Private']
    Click Element                    //label[text()='Private']
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Filter']
    Click Element                    //span[text()='Filter']
    Wait Until Page Ready

open visibility filter and filter open public shifts
    Wait Until Page Ready
    Scroll Element Into View         //span[text()='Visibility']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Visibility']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Click Element                    //span[text()='Visibility']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Ready
    Wait Until Element Is Visible    //label[text()='Public']
    Click Element                    //label[text()='Public']
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Filter']
    Click Element                    //span[text()='Filter']
    Wait Until Page Ready

select first shift from the list
    Wait Until Page Ready
    Scroll Element Into View         (//a[@class='active'])[1]
    Wait Until Page Ready
    Wait Until Element Is Visible    (//a[@class='active'])[1]
    Wait Until Page Ready
    Click Element                    (//a[@class='active'])[1]
    Wait Until Page Ready
    Wait Until Element Is Visible    //a[@class='pool-title text-decoration-none']
    Wait Until Page Ready
    Click Element                    //a[@class='pool-title text-decoration-none']
    Wait Until Page Ready


open shift edit dropdown and edit private shift
    Wait Until Page Ready
    Scroll Element Into View         //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-rounded-md k')]
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-rounded-md k')]
    Wait Until Page Ready
    Click Element                    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-rounded-md k')]
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Edit Shift']
    Click Element                    //span[text()='Edit Shift']
    Wait Until Page Ready

open shift edit dropdown and click on cancel shift
    Wait Until Page Ready
    Scroll Element Into View         //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-rounded-md k')]
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-rounded-md k')]
    Wait Until Page Ready
    Click Element                    //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-rounded-md k')]
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Cancel Shift']
    Click Element                    //span[text()='Cancel Shift']
    Wait Until Page Ready


click on continue for edit open shift
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Continue']
    Click Element                    //span[text()='Continue']
    Wait Until Page Ready


edit number of opening edit shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[contains(@class,'k-icon k-svg-icon k-svg-i-caret-alt-u')]
    Wait Until Page Ready
    Click Element                    //span[contains(@class,'k-icon k-svg-icon k-svg-i-caret-alt-u')]
    Wait Until Page Ready
    Click Element                    //span[contains(@class,'k-icon k-svg-icon k-svg-i-caret-alt-u')]
    Wait Until Page Ready

click on save on edit shift window
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Save']
    Wait Until Page Ready
    Click Element                    //span[text()='Save']
    Wait Until Page Ready

enable private toggle on edit open public shift
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[@class='k-switch k-switch-md k-switch-off me-3 ms-3']
    Click Element                    //span[@class='k-switch k-switch-md k-switch-off me-3 ms-3']
    Wait Until Page Ready
    
disable private toggle on edit open private shift
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[@class='k-switch k-switch-md k-switch-on me-3 ms-3']
    Click Element                    //span[@class='k-switch k-switch-md k-switch-on me-3 ms-3']
    Wait Until Page Ready