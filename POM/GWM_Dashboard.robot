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
click on Local Contracts Ending in 30 days hyperlink on gwm dashboard
    Wait Until Page Ready
    Wait Until Element Is Visible    //a[text()='Local Contracts Ending in 30 days']    ${TIMEOUT}
    Click Element                    //a[text()='Local Contracts Ending in 30 days']
    Wait Until Page Ready

Validate by clicking on Local Contracts Ending in 30 days hyperlink on gwm dashboard it directs user to float pool with quick filter "contract ends in 30 days " enabled
    Wait Until Page Ready
    Wait Until Element Is Visible    //h1[text()='Float Pool']    ${TIMEOUT}
    Wait Until Page Ready
    ${Float_pool_page_header}=    Get Text    //h1[text()='Float Pool']
    Wait Until Page Ready
    Set Global Variable    ${Float_pool_page_header}    ${Float_pool_page_header}
    Log                    ${Float_pool_page_header}
    Should Be Equal        ${Float_pool_page_header}     Float Pool
    Wait Until Page Ready
    ${class}=    Get Element Attribute    //div[contains(@class, 'card-wrapper') and .//p[text()='Contracts ending in 30 days']]    class
    Log    Class value: ${class}
    Should Contain    ${class}    selected    The filter should be in selected state

click on Shifts Need Confirmation hyperlink on gwm dashboard
    Wait Until Page Ready
    Wait Until Element Is Visible    //a[text()='Shifts Need Confirmation']    ${TIMEOUT}
    Click Element                    //a[text()='Shifts Need Confirmation']
    Wait Until Page Ready


Validate by clicking on Shifts Need Confirmation hyperlink on gwm dashboard it directs user to schedule's manage open shift page with quick fiter "need confirmation" enabled
    Wait Until Page Ready
    Wait Until Element Is Visible             //span[text()='Manage Open Shifts']    ${TIMEOUT}
    ${Manage Open Shifts tab}=    Get Text    //span[text()='Manage Open Shifts']
    Set Global Variable      ${Manage Open Shifts tab}    ${Manage Open Shifts tab}
    Log                      ${Manage Open Shifts tab}
    Should Be Equal          ${Manage Open Shifts tab}    MANAGE OPEN SHIFTS
    ${class}=    Get Element Attribute    //div[contains(@class, 'card-wrapper') and .//span[text()='Need Confirmation']]    class
    Log    Filter card class: ${class}
    Should Contain    ${class}    selected    The "Need Confirmation" filter should be selected

click on close shift option in open shifts table and click on continue
    Wait Until Page Ready
    ${elements}=    Get WebElements    xpath=//button[text()='CLOSE']
    Run Keyword If    ${elements}
    ...    Run Keywords
    ...    Scroll Element Into View    xpath=(//button[text()='CLOSE'])[1]
    ...    AND    Click Element    xpath=(//button[text()='CLOSE'])[1]
    ...    ELSE
    ...    Run Keywords
    ...    Log    message=Shifts not present    console=True
    ...    AND    Return From Keyword
    Wait Until Page Ready
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[@class='k-button-text' and text()='Continue']    ${TIMEOUT}
    Click Element                    //span[@class='k-button-text' and text()='Continue']
    Wait Until Page Ready


click on offer shift option in open shifts table
    Wait Until Page Ready
    ${elements}=    Get WebElements        //button[text()='OFFER']
    Run Keyword If    ${elements}
    ...    Run Keywords
    ...    Scroll Element Into View    xpath=(//button[text()='OFFER'])[1]
    ...    AND    Click Element    xpath=(//button[text()='OFFER'])[1]
    ...    ELSE
    ...    Run Keywords
    ...    Log    message=Shifts not present    console=True
    ...    AND    Return From Keyword


Select Talent To Offer Shift And Offer Shift
    Wait Until Page Ready

    # Step 1: Check if "All Available Talent" is visible and enabled
    ${is_present}=    Run Keyword And Return Status    Element Should Be Visible    //label[text()='All Available Talent']
    ${is_clickable}=  Run Keyword And Return Status    Element Should Be Enabled    //label[text()='All Available Talent']

    Run Keyword Unless    ${is_present} and ${is_clickable}
    ...    Run Keywords
    ...    Log    message=No talents available    console=True
    ...    AND    Return From Keyword

    # If All Available Talent is visible and clickable, proceed
    Click Element    //label[text()='All Available Talent']
    Wait Until Page Ready

    # Step 2: Check if "OFFER SHIFT" is visible and enabled
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    //span[text()='OFFER SHIFT']
    ${is_clickable}=  Run Keyword And Return Status    Element Should Be Enabled    //span[text()='OFFER SHIFT']

    Run Keyword If    ${is_visible} and ${is_clickable}
    ...    Run Keywords
    ...    Scroll Element Into View    //span[text()='OFFER SHIFT']
    ...    AND    Sleep    1s
    ...    AND    Run Keyword And Ignore Error    Click Element    //span[text()='OFFER SHIFT']
    ...    ELSE
    ...    Run Keywords
    ...    Log    message=No talents available    console=True
    ...    AND    Return From Keyword

    
