*** Settings ***
Documentation        Definity
Library        SeleniumLibrary
Library           ScreenCapLibrary
Resource    ../Resources/resource.robot


*** Keywords ***
open talents page
    Wait Until Element Is Enabled    //li[@class='nav-section-item '][2]    ${TIMEOUT}
    Click Element    //li[@class='nav-section-item '][2]
    Sleep    ${WAIT_TIME}
filter applicants
    Wait Until Page Contains Element    //span[@class='icon-indicate icon-applicant']    ${TIMEOUT}
    Click Element    //span[@class='icon-indicate icon-applicant']
    Sleep    ${WAIT_TIME}
filter applied status talents
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']    ${TIMEOUT}
    Click Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Applied']    ${TIMEOUT}
    Click Element        //label[text()='Applied']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}
select applied status talent
    Wait Until Element Is Enabled    (//table//tr//a)[1]    ${TIMEOUT}
    Click Element    (//table//tr//a)[1]
    Sleep    ${WAIT_TIME}
    ${old_start_date} =    Get Text    (//td[@class='p-0'])[1]
    ${old_date}    Set Variable    ${old_start_date}
    Set Suite Variable    ${old_date}

edit applied status talent
    Wait Until Element Is Enabled    //div[@class='k-dropdown-button ms-2 mb-3']    ${TIMEOUT}
    Click Element    //div[@class='k-dropdown-button ms-2 mb-3']
    Sleep    ${WAIT_TIME}
    Wait Until Element Is Enabled    //span[text()='Edit']    ${TIMEOUT}
    Click Element    //span[text()='Edit']
    Sleep    ${WAIT_TIME}


change the start date of applied status talent
    Wait Until Element Is Enabled    (//div[@class='MuiInputAdornment-root MuiInputAdornment-positionEnd MuiInputAdornment-outlined MuiInputAdornment-sizeMedium css-yxqbup'])[1]    ${TIMEOUT}
    Click Element    (//div[@class='MuiInputAdornment-root MuiInputAdornment-positionEnd MuiInputAdornment-outlined MuiInputAdornment-sizeMedium css-yxqbup'])[1]
    Sleep    ${WAIT_TIME}
    
    Wait Until Page Contains Element    //button[@title='Next month']    ${TIMEOUT}
    Click Element    //button[@title='Next month']
    Sleep    ${WAIT_TIME}  
    Wait Until Page Contains Element    //button[contains(text(),'11')]    ${TIMEOUT}
    Click Element    //button[contains(text(),'11')]
    Sleep    ${WAIT_TIME}     
    
#    # Loop through months until the fixed date is enabled or max attempts reached
#    FOR    ${month}    IN RANGE    1    12
#        Log    "Checking month: ${month}"
#
#        # Check if the fixed date is enabled
#        ${is_visible} =    Run Keyword And Return Status    Element Should Be Visible       //button[contains(text(),'11')]
#
#        IF    ${is_visible}
#            ${is_enabled} =    Run Keyword And Return Status    Element Should Be Enabled    //button[contains(text(),'11')]
#
#            IF    ${is_enabled}
#                Log    "Enabled date found! Clicking it."
#                Click Element    //button[contains(text(),'11')]
#                BREAK    # Exit the loop once the enabled date is found
#            ELSE
#                Log    "Date is disabled. Checking next month."
#                Click Element      //button[@title='Next month']
#                Sleep    1s    # Wait for the next month to load
#            END
#        ELSE
#            Log    "Date not visible. Clicking next month."
#            Click Element    //button[@title='Next month']
#            Sleep    1s
#        END
#    END

capture edited start date of submittal and compare with start date after saving
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Start Date']/../..//input[contains(@class,'M')]        ${TIMEOUT}
#    ${expected_start_date} =    Get Text    (//input[contains(@class,'M')])[1]

    Wait Until Element Is Enabled    //span[contains(text(),'Save')]    ${TIMEOUT}
    Click Element        //span[contains(text(),'Save')]
    Sleep    ${WAIT_TIME}
    ${new_start_date} =    Get Text    (//td[@class='p-0'])[1]
    Log To Console    ${new_start_date}
    Log To Console        ${old_date}
    

    IF    '${old_date}' != '${new_start_date}'
        Log    "submittal is edited successfully"
    ELSE
        Log    " submittal is not edited successfully"
    END


shortlist applied status talent
    Wait Until Page Contains Element    //button//span[text()='Shortlist']    ${TIMEOUT}
    Click Element    //button//span[text()='Shortlist']
    Sleep    ${WAIT_TIME}
interview scheduled applied status talent
    Wait Until Page Contains Element    //button//span[text()='Interview Scheduled']    ${TIMEOUT}
    Click Element    //button//span[text()='Interview Scheduled']
    Sleep    ${WAIT_TIME}

interview complete applied status talent
    Wait Until Page Contains Element    //button//span[text()='Interview Complete']    ${TIMEOUT}
    Click Element    //button//span[text()='Interview Complete']
    Sleep     ${WAIT_TIME}

extend offer applied status talent
    Wait Until Page Contains Element    //button//span[text()='Extend Offer']    ${TIMEOUT}
    Click Element    //button//span[text()='Extend Offer']
    Sleep    ${WAIT_TIME}
    
    
filter on assignment talents
    Wait Until Element Is Enabled        //p[text()='On Assignment']    ${TIMEOUT}
    Click Element    //p[text()='On Assignment']
#    Sleep    ${WAIT_TIME}
select on assignment talent from the list
    Wait Until Element Is Enabled    (//table//td//a)[1]    ${TIMEOUT}
    Click Element    (//table//td//a)[1]
    Sleep    ${WAIT_TIME}
edit on assignment talent
    Wait Until Page Contains Element      (//td[@class='p-0'])[1]
    ${old_end_date} =    Get Text    (//td[@class='p-0'])[1]
    ${end_date}    Set Variable    ${old_end_date}
    Set Suite Variable    ${end_date}

    Wait Until Element Is Enabled    //button[contains(@aria-label,'undefined dropdownbutton')]    ${TIMEOUT}
    Click Element    //button[contains(@aria-label,'undefined dropdownbutton')]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element        //span[text()='Edit']    ${TIMEOUT}
    Click Element    //span[text()='Edit']
    Sleep    ${WAIT_TIME}

edit end date of on assignment status talent save and validate after saving
    Wait Until Page Contains Element    //button[contains(@class,'MuiButtonBase-root MuiIconButton')]    ${TIMEOUT}
    Click Element    //button[contains(@class,'MuiButtonBase-root MuiIconButton')]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //button[contains(@aria-label,'Next month')]    ${TIMEOUT}
    Click Element    //button[contains(@aria-label,'Next month')]
    Sleep    1

    Wait Until Page Contains Element    (//button[contains(@class,'MuiButtonBase-root MuiPicker')])[1]    ${TIMEOUT}
    Click Element    (//button[contains(@class,'MuiButtonBase-root MuiPicker')])[1]
    Sleep    ${WAIT_TIME}

    Wait Until Page Contains Element    //input[contains(@name,'endDate')]        ${TIMEOUT}
    Wait Until Page Contains Element    //span[contains(text(),'Save')]    ${TIMEOUT}
    Click Element    //span[contains(text(),'Save')]
    Sleep    ${WAIT_TIME}

    ${actual_end_date} =    Get Text    (//td[@class='p-0'])[1]
    Log To Console     ${actual_end_date}
    Log To Console     ${end_date}

    IF    '${end_date}' != '${actual_end_date}'
        Log    " placement edited successfully"
    ELSE
        Log    " editing placement failed"
    END

select talent pool tab
    Wait Until Page Contains Element    //span[text()='Talent Pool']    ${TIMEOUT}
    Sleep              ${WAIT_TIME}
    Click Element    //span[text()='Talent Pool']
    Sleep              ${WAIT_TIME}

filter pending start talents
    Wait Until Page Contains Element    //p[text()='Pending Start']    ${TIMEOUT}
    Sleep       ${WAIT_TIME}
    Click Element    //p[text()='Pending Start']
    Sleep              ${WAIT_TIME}

select pending start candidate from list
    Wait Until Page Contains Element    (//tr//td//a)[1]    ${TIMEOUT}
    Sleep        ${WAIT_TIME}
    Wait Until Page Contains Element    (//tr//td//a)[1]
    Sleep    ${WAIT_TIME}



    
    


    