*** Settings ***
Documentation    Definity
Library          SeleniumLibrary
Library          ScreenCapLibrary
Resource         ../Resources/resource.robot
Resource         ../Resources/variables.robot
Library          OperatingSystem
Library          Collections
Library          String
Variables        ../Resources/variable.py

*** Keywords ***
open vendor portal and login
    Create Webdriver       ${browser}
    Delete All Cookies
    Go To    ${vendor_url}
    Maximize Browser Window
    Wait Until Page Ready
    Input Text    xpath://input[@name='emailAddress']    ${vendor_username}
    Input Password    xpath://input[@name='password']    ${vendor_pwd}
    Click Button    xpath://button[@type='submit']
    Wait Until Page Ready

open jobs page in vendor portal
    Wait Until Page Contains Element        //a[@href='/job-order']           ${TIMEOUT}
    Wait Until Page Ready
    Mouse Over                              //a[@href='/job-order']
    Wait Until Page Ready
    Click Element                           //a[@href='/job-order']
    Wait Until Page Ready

filter job by job id in vendor portal
    Wait Until Page Contains Element        //span[text()='All Job Requisitions']        ${TIMEOUT}
    Mouse Over                              //span[text()='All Job Requisitions']
    Wait Until Page Ready
    Wait Until Page Contains Element        //span[text()='Job Details']/../..//a        ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //span[text()='Job Details']/../..//a
    Wait Until Page Ready
    Wait Until Page Contains Element        //input[@class='k-input-inner k-input k-input-md k-rounded-md k-input-solid']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //input[@class='k-input-inner k-input k-input-md k-rounded-md k-input-solid']
    Wait Until Page Ready
    Input Text                              //input[@class='k-input-inner k-input k-input-md k-rounded-md k-input-solid']    ${JOB_ID}
    Wait Until Page Ready

click on check all option in filter window on jobs page in vendor portal
    Wait Until Page Contains Element        //label[text()='Check All']        ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //label[text()='Check All']
    Wait Until Page Ready

click on filter option in filter window on jobs page in vendor portal
    Wait Until Page Contains Element        //span[text()='Filter']            ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //span[text()='Filter']
    Wait Until Page Ready
    
select first job from the list on jobs page in vendor portal
    Wait Until Page Contains Element        (//span[@class='name-col cursor-pointer'])[1]    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           (//span[@class='name-col cursor-pointer'])[1]
    Wait Until Page Ready

click on submit talent in talent details page in vendor portal
    Wait Until Page Contains Element        //span[text()='Submit Talent']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //span[text()='Submit Talent']
    
fill talent details while submitting talent in vendor portal
#enter ssn for new talent
    Wait Until Page Contains Element        //input[@id='ssn']    ${TIMEOUT}
    Wait Until Page Ready
    Input Text                              //input[@id='ssn']    ${ssn}
    Wait Until Page Ready
#enter date of birth for new talent
    Wait Until Page Contains Element        //input[@name='dateOfBirth']/..//div    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //input[@name='dateOfBirth']/..//div
    Wait Until Page Ready
    WHILE    True
        TRY
            Element Should Be Visible    //div[text()='January 2025']    ${TIMEOUT}
            Click Element    //button[text()='1']
            Log    Found January 2015 and clicked day 1
            Exit For Loop
        EXCEPT
            Click Element    //button[@title='Previous month']
            Wait Until Page Ready
        END
    END
#enter address 1
    Wait Until Page Contains Element         //input[@name='address1']    ${TIMEOUT}
    Scroll Element Into View                 //input[@name='address1']
    Wait Until Page Ready
    Input Text                               //input[@name='address1']       ${address1}
    Wait Until Page Ready

#enter first name
    Wait Until Page Contains Element        //input[@name='firstName']    ${TIMEOUT}
    Scroll Element Into View                //input[@name='firstName']
    Wait Until Page Ready
    Input Text                              //input[@name='firstName']    ${first_name}
    Wait Until Page Ready

#enter last name
    Wait Until Page Contains Element        //input[@name='lastName']      ${TIMEOUT}
    Scroll Element Into View                //input[@name='lastName']
    Wait Until Page Ready
    Input Text                              //input[@name='lastName']    ${last_name}
    Wait Until Page Ready

#enter city name
    Wait Until Page Contains Element        //input[@name='city']     ${TIMEOUT}
    Scroll Element Into View                //input[@name='city']
    Wait Until Page Ready
    Input Text                              //input[@name='city']     ${city}
    Wait Until Page Ready
#enter email address
    Wait Until Page Contains Element        //input[@name='emailAddress']     ${TIMEOUT}
    Scroll Element Into View                //input[@name='emailAddress']
    Wait Until Page Ready
    Input Text                              //input[@name='emailAddress']     ${email}
    Wait Until Page Ready

#enter zip code
    Wait Until Page Contains Element        //input[@name='zip']     ${TIMEOUT}
    Scroll Element Into View                //input[@name='zip']
    Wait Until Page Ready
    Input Text                              //input[@name='zip']     ${zip}
    Wait Until Page Ready
#enter phone no
    Wait Until Page Contains Element        //input[@name='phoneNumber']     ${TIMEOUT}
    Scroll Element Into View                //input[@name='phoneNumber']
    Wait Until Page Ready
    Input Text                              //input[@name='phoneNumber']     ${phone}
    Wait Until Page Ready

#select state
    Wait Until Page Contains Element        //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-icon-button k-i')]     ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View                //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-icon-button k-i')]
    Wait Until Page Ready
    Click Element                           //button[contains(@class,'k-button k-button-md k-button-solid k-button-solid-base k-icon-button k-i')]
    Wait Until Page Ready
    Wait Until Page Contains Element        (//span[@class='k-list-item-text'])[1]     ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View                (//span[@class='k-list-item-text'])[1]
    Wait Until Page Ready
    Click Element                           (//span[@class='k-list-item-text'])[1]
    Wait Until Page Ready

#professional summary
    Scroll Element Into View                //textarea[@id='professionalSummary']
    Wait Until Page Contains Element        //textarea[@id='professionalSummary']    ${TIMEOUT}
    Wait Until Page Ready
    Input Text                              //textarea[@id='professionalSummary']    ${professional_summary}
    Wait Until Page Ready

#years of experience
    Scroll Element Into View               //input[@name='yearsOfExperience']
    Wait Until Page Contains Element       //input[@name='yearsOfExperience']    ${TIMEOUT}
    Wait Until Page Ready
    Input Text                             //input[@name='yearsOfExperience']    ${experience}
    Wait Until Page Ready

#upload resume
    Scroll Element Into View                //p[contains(text(),'Enhance your submission by providing a')]
    Wait Until Page Ready
    Wait Until Page Contains Element        (//input[@type='file'])[2]    ${TIMEOUT}
    Wait Until Page Ready
    Choose File                             (//input[@type='file'])[2]    ${FILE}
    Wait Until Page Ready

click on step2 while submitting the talent to a job in vendor side
    Wait Until Page Contains Element        //span[text()='STEP 2']        ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View                //span[text()='STEP 2']
    Wait Until Page Ready
    Click Element                           //span[text()='STEP 2']
    Wait Until Page Ready

capture the updated regular rate and validate the talent is submitted to updated regular rate to a job in vendor side
    Wait Until Page Contains Element        //input[@name='regularRate']        ${TIMEOUT}
    Wait Until Page Ready
    ${talent_submitted_updated_regular_rate}=    Get Value    //input[@name='regularRate']
    Log    The value of talent_submitted_updated_regular_rate is: ${talent_submitted_updated_regular_rate}
    Log    The value of actual regular rate is: ${regular_rate}
    Wait Until Page Ready
    ${expected_str}=    Convert To String    ${regular_rate}
    Should Contain      ${talent_submitted_updated_regular_rate}    ${expected_str}

