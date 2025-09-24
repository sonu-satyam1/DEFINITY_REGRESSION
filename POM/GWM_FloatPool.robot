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
navigate to gwm page
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[contains(@class,'ats-bottom')]    ${TIMEOUT}
    Scroll Element Into View         //button[contains(@class,'ats-bottom')]
    Mouse Over                       //div[@class='ats-bottom-dropdown']
    Wait Until Page Ready
    Click Element                    //div[@class='ats-bottom-dropdown']
    Mouse Over                       //span[text()='GWM']
    Sleep                            ${WAIT_TIME}
    Wait Until Page Ready
    Click Element                    //span[text()='GWM']
navigate to hcs core page
    Wait Until Page Ready
    Wait Until Element Is Visible    //button[contains(@class,'ats-bottom')]    ${TIMEOUT}
    Scroll Element Into View         //button[contains(@class,'ats-bottom')]
    Mouse Over                       //div[@class='ats-bottom-dropdown']
    Wait Until Page Ready
    Click Element                    //div[@class='ats-bottom-dropdown']
    Mouse Over                       //span[text()='CORE']
    Sleep                            ${WAIT_TIME}
    Wait Until Page Ready
    Click Element                    //span[text()='CORE']

navigate to FloatPool Page from welcome page
    Wait Until Page Ready
    Wait Until Element Is Visible        //span[contains(@class,'icon-workforce nav-icon me-2')]    ${TIMEOUT}
    Click Element                        //span[contains(@class,'icon-workforce nav-icon me-2')]

navigate to Schedules Page from welcome page
    Wait Until Page Ready
    Wait Until Element Is Visible        //span[contains(@class,'icon-calendar-month nav-icon me-2')]    ${TIMEOUT}
    Click Element                        //span[contains(@class,'icon-calendar-month nav-icon me-2')]
    Wait Until Page Ready

navigate to Dashboard Page from welcome page
    Wait Until Page Ready
    Wait Until Element Is Visible        //span[contains(@class,'icon-home nav-icon me-2')]    ${TIMEOUT}
    Click Element                        //span[contains(@class,'icon-home nav-icon me-2')]
    Wait Until Page Ready

open first talent details from talent pool page
    Wait Until Page Ready
    Wait Until Element Is Visible        (//tr[@class='k-table-row k-master-row']//a)[1]           ${TIMEOUT}
    Scroll Element Into View             (//tr[@class='k-table-row k-master-row']//a)[1]
    Click Element                        (//tr[@class='k-table-row k-master-row']//a)[1]
    
open first talent details from talent pool page and store name in variable
    Wait Until Page Ready
    Wait Until Element Is Visible        (//tr[@class='k-table-row k-master-row']//a)[1]           ${TIMEOUT}
    Scroll Element Into View             (//tr[@class='k-table-row k-master-row']//a)[1]
    ${float_pool_talent_name}=           Get Text        (//tr[@class='k-table-row k-master-row']//a)[1]
    Set Global Variable                  ${float_pool_talent_name}
    Log                                  ${float_pool_talent_name}
    Wait Until Page Ready
    Click Element                        (//tr[@class='k-table-row k-master-row']//a)[1]
    Wait Until Page Ready

open core talents page
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[@class='icon-workforce nav-icon me-2']   ${TIMEOUT}
    Click Element                    //span[@class='icon-workforce nav-icon me-2']
    Wait Until Page Ready

search for talent details in submittals placements tab on core talents page
    Wait Until Page Ready
    Wait Until Element Is Visible    //input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Input Text                       //input[@class='k-input k-input-md k-rounded-md k-input-solid']    ${float_pool_talent_name}
   
open talent details on core talents page
    Wait Until Page Ready
    Wait Until Element Is Visible    (//tr[@class='k-table-row k-master-row']//a)[1]
    Click Element                    (//tr[@class='k-table-row k-master-row']//a)[1]
    Wait Until Page Ready

validate talent status should be on assignment or early end
    Wait Until Page Ready
    Wait Until Element Is Visible    //div[@class='d-flex align-items-center flex-wrap mb-2 me-2']//span
    ${talent_status}=    Get Text    //div[@class='d-flex align-items-center flex-wrap mb-2 me-2']//span
    Log    Talent status found: ${talent_status}
    ${status_lower}=    Convert To Lowercase    ${talent_status}
    Run Keyword Unless    '${status_lower}' in ['on assignment', 'early end']    Fail    Talent status should be "on assignment" or "early end", but found: ${talent_status}

Validate End Date Is Today Or Future
    Wait Until Page Ready
    Wait Until Element Is Visible    xpath=//span[contains(@class,'viewpage-info-text')]
    ${full}=    Get Text    xpath=//span[contains(@class,'viewpage-info-text')]
    @{parts}=   Split String    ${full}    -
    ${second}=  Strip String    ${parts}[1]
    Log    Second date: ${second}

    # Convert the extracted string (MM/DD/YYYY) into a datetime
    ${second_date}=    Convert Date    ${second}    result_format=%Y-%m-%d    date_format=%m/%d/%Y
    ${today}=          Get Current Date    result_format=%Y-%m-%d

    Run Keyword Unless    '${second_date}' >= '${today}'    Fail    Second date ${second_date} is in the past!

click on float locations filter
    Wait Until Page Ready
    Scroll Element Into View         //label[contains(text(),'Float L')]
    Click Element                    //label[normalize-space(.)='Float Locations']/preceding-sibling::div[contains(@class,'k-multiselect')]

click on float department filter
    Wait Until Page Ready
    Scroll Element Into View         //label[contains(text(),'Float L')]
    Click Element                    //label[normalize-space(.)='Float Locations']/preceding-sibling::div[contains(@class,'k-multiselect')]

select one location from float locations dropdown and store name in variable
    Wait Until Page Ready
    Wait Until Element Is Visible           (//li[@class='k-list-item'])[1]
    ${floatpool_location}=    Get Text      (//li[@class='k-list-item'])[1] 
    Set Global Variable      ${floatpool_location}    ${floatpool_location}
    Log                                     ${floatpool_location}
    Click Element                           (//li[@class='k-list-item'])[1]

click on apply button
    Wait Until Page Ready
    Wait Until Element Is Visible    //span[text()='Apply']
    Click Element                    //span[text()='Apply']
    Wait Until Page Ready


Filter Float Location And Validate
    ${index}=    Set Variable    1
    WHILE    True
        Wait Until Page Ready

        # Open Float Locations filter
        Scroll Element Into View    //label[contains(text(),'Float L')]
        Click Element    //label[normalize-space(.)='Float Locations']/preceding-sibling::div[contains(@class,'k-multiselect')]

        # Build dynamic locator with index
        ${locator}=    Set Variable    (//li[@class='k-list-item'])[${index}]
        ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    5s
        Run Keyword Unless    ${status}    Fail    "No more locations available to select at index ${index}"

        # Get location text
        ${floatpool_location}=    Get Text    ${locator}
        ${floatpool_location}=    Strip String    ${floatpool_location}
        Log     Trying float location: ${floatpool_location}

        # Split if multiple locations (separated by "/")
        @{locations}=    Split String    ${floatpool_location}    /
        @{locations_clean}=    Create List
        FOR    ${loc}    IN    @{locations}
            ${loc}=    Strip String    ${loc}
            ${loc}=    Convert To Lowercase    ${loc}
            Append To List    ${locations_clean}    ${loc}
        END

        # Select the location
        Set Global Variable    ${floatpool_location}
        Click Element    ${locator}
        Wait Until Page Ready

        # Apply button
        Wait Until Element Is Visible    //span[text()='Apply']
        Click Element    //span[text()='Apply']
        Wait Until Page Ready

        #Check if table rows are present
        ${rows_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//tr[@class='k-table-row k-master-row']//td    5s

        IF    ${rows_visible}
            # Collect and validate row texts
            @{rows}=    Get WebElements    xpath=//tr[@class='k-table-row k-master-row']//td
            @{row_texts}=    Create List
            FOR    ${row}    IN    @{rows}
                ${text}=    Get Text    ${row}
                ${text}=    Convert To Lowercase    ${text}
                Append To List    ${row_texts}    ${text}
            END

            Log     Found rows (lowercased): ${row_texts}

            #Validate at least one location is present
            ${match}=    Set Variable    False
            FOR    ${loc}    IN    @{locations_clean}
                ${status}=    Run Keyword And Return Status    List Should Contain Value    ${row_texts}    ${loc}
                IF    ${status}
                    ${match}=    Set Variable    True
                    Exit For Loop
                END
            END

            Run Keyword If    ${match}    Exit For Loop
            Log     None of the locations ${locations_clean} found in rows, trying next...
        ELSE
            Log     No rows found for location ${floatpool_location}, clearing and trying next...
            # Clear selection
            ${clear_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    //span[@class='k-clear-value']    2s
            IF    ${clear_status}
                Click Element    //span[@class='k-clear-value']
                Wait Until Page Ready
            END
        END

        #Increase index before retry
        ${index}=    Evaluate    ${index} + 1
        Sleep    2s
    END




Filter Float Department And Validate

    ${index}=    Set Variable    1
    WHILE    True
        Wait Until Page Ready

        # Open Float Departments filter
        Scroll Element Into View    //label[contains(text(),'Float D')]
        Click Element    //label[normalize-space(.)='Float Departments']/preceding-sibling::div[contains(@class,'k-multiselect')]

        # Build dynamic locator for current index
        ${locator}=    Set Variable    (//li[@class='k-list-item'])[${index}]
        ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    5s
        Run Keyword Unless    ${status}    Fail    "No more departments available to select at index ${index}"

        # Get department text
        ${floatpool_department}=    Get Text    ${locator}
        ${floatpool_department}=    Strip String    ${floatpool_department}
        Log     Trying floatpool_department: ${floatpool_department}

        # Split if multiple departments (separated by "/")
        @{departments}=    Split String    ${floatpool_department}    /
        @{departments_clean}=    Create List
        FOR    ${dept}    IN    @{departments}
            ${dept}=    Strip String    ${dept}
            ${dept}=    Convert To Lowercase    ${dept}
            Append To List    ${departments_clean}    ${dept}
        END

        # Select the department from dropdown
        Set Global Variable    ${floatpool_department}
        Scroll Element Into View    ${locator}
        Click Element    ${locator}
        Wait Until Page Ready

        # Apply button
        Wait Until Element Is Visible    //span[text()='Apply']
        Click Element    //span[text()='Apply']
        Wait Until Page Ready

        #Check if table rows are present
        ${rows_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//tr[@class='k-table-row k-master-row']//td    5s

        IF    ${rows_visible}
            # Collect and validate row texts
            @{rows}=    Get WebElements    xpath=//tr[@class='k-table-row k-master-row']//td
            @{row_texts}=    Create List
            FOR    ${row}    IN    @{rows}
                ${text}=    Get Text    ${row}
                ${text}=    Convert To Lowercase    ${text}
                Append To List    ${row_texts}    ${text}
            END

            Log To Console    Found rows (lowercased): ${row_texts}

            #Validate at least one department is present
            ${match}=    Set Variable    False
            FOR    ${dept}    IN    @{departments_clean}
                ${status}=    Run Keyword And Return Status    List Should Contain Value    ${row_texts}    ${dept}
                IF    ${status}
                    ${match}=    Set Variable    True
                    Exit For Loop
                END
            END

            Run Keyword If    ${match}    Exit For Loop
            Log     None of the departments ${departments_clean} found in rows, trying next...
        ELSE
            Log     No rows found for department ${floatpool_department}, clearing and trying next...
            # Clear selection
            ${clear_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    //span[@class='k-clear-value']    2s
            IF    ${clear_status}
                Click Element    //span[@class='k-clear-value']
                Wait Until Page Ready
            END
        END

        #Increase index before retry
        ${index}=    Evaluate    ${index} + 1
    END

Filter Float Skills And Validate

    ${index}=    Set Variable    1
    WHILE    True
        Wait Until Page Ready

        # Open Float skills filter
        Scroll Element Into View    //label[contains(text(),'Float S')]
        Click Element    //label[normalize-space(.)='Float Skills']/preceding-sibling::div[contains(@class,'k-multiselect')]

        # Build dynamic locator for current index
        ${locator}=    Set Variable    (//li[@class='k-list-item'])[${index}]
        ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    5s
        Run Keyword Unless    ${status}    Fail    "No more departments available to select at index ${index}"

        # Get skills text
        ${floatpool_Skills}=    Get Text    ${locator}
        ${floatpool_Skills}=    Strip String    ${floatpool_Skills}
        Log     Trying floatpool_Skills: ${floatpool_Skills}

        # Split if multiple skills (separated by "/")
        @{skills}=    Split String    ${floatpool_Skills}    /
        @{skills_clean}=    Create List
        FOR    ${skill}    IN    @{skills}
            ${skill}=    Strip String    ${skill}
            ${skill}=    Convert To Lowercase    ${skill}
            Append To List    ${skills_clean}    ${skill}
        END

        # Select the skills from dropdown
        Set Global Variable    ${floatpool_Skills}
        Scroll Element Into View    ${locator}
        Click Element    ${locator}
        Wait Until Page Ready

        # Apply button
        Wait Until Element Is Visible    //span[text()='Apply']
        Click Element    //span[text()='Apply']
        Wait Until Page Ready

        # Check if table rows are present
        ${rows_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//tr[@class='k-table-row k-master-row']//td    5s

        IF    ${rows_visible}
            # Collect and validate row texts
            @{rows}=    Get WebElements    xpath=//tr[@class='k-table-row k-master-row']//td
            @{row_texts}=    Create List
            FOR    ${row}    IN    @{rows}
                ${text}=    Get Text    ${row}
                ${text}=    Convert To Lowercase    ${text}
                Append To List    ${row_texts}    ${text}
            END

            Log     Found rows (lowercased): ${row_texts}

            # Validate at least one skills is present
            ${match}=    Set Variable    False
            FOR    ${dept}    IN    @{skills_clean}
                ${status}=    Run Keyword And Return Status    List Should Contain Value    ${row_texts}    ${dept}
                IF    ${status}
                    ${match}=    Set Variable    True
                    Exit For Loop
                END
            END

            Run Keyword If    ${match}    Exit For Loop
            Log     None of the skills ${skills_clean} found in rows, trying next...
        ELSE
            Log     No rows found for floatpool_Skills ${floatpool_Skills}, clearing and trying next...
            # Clear selection
            ${clear_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    //span[@class='k-clear-value']    2s
            IF    ${clear_status}
                Click Element    //span[@class='k-clear-value']
                Wait Until Page Ready
            END
        END

        #Increase index before retry
        ${index}=    Evaluate    ${index} + 1
    END

#quick filters
#contract ending in 30days quick filter
click on contract ending in 30days quick filter
    Wait Until Page Ready
    Wait Until Element Is Visible        //p[text()='Contracts ending in 30 days']
    Wait Until Page Ready
    Click Element                        //p[text()='Contracts ending in 30 days']
    Wait Until Page Ready
get contact ending in 30days quick filter count 
    Wait Until Page Ready
    Wait Until Element Is Visible        //p[text()='Contracts ending in 30 days']/../..//h2
    ${contact ending in 30days quick filter count}=    Get Text    //p[text()='Contracts ending in 30 days']/../..//h2
    Set Global Variable        ${contact ending in 30days quick filter count}    ${contact ending in 30days quick filter count}
    Wait Until Page Ready
    Log                                  ${contact ending in 30days quick filter count}  
      

validate contact ending in 30days quick filter count
    Wait Until Page Ready
    Wait Until Element Is Visible        //span[@class='k-pager-info']
    Wait Until Page Ready
    ${actual contact ending in 30days quick filter count}=    Get Text    //span[@class='k-pager-info']
    Should Contain    ${actual contact ending in 30days quick filter count}    ${contact ending in 30days quick filter count}
    Log               ${contact ending in 30days quick filter count}
    Log               ${actual contact ending in 30days quick filter count}
    Wait Until Page Ready


#contract ending in 60days quick filter
click on contract ending in 60days quick filter
    Wait Until Page Ready
    Wait Until Element Is Visible        //p[text()='Contracts ending in 60 days']
    Wait Until Page Ready
    Click Element                        //p[text()='Contracts ending in 60 days']
    Wait Until Page Ready

get contact ending in 60days quick filter count
    Wait Until Page Ready
    Wait Until Element Is Visible        //p[text()='Contracts ending in 60 days']/../..//h2
    ${contact ending in 60days quick filter count}=    Get Text    //p[text()='Contracts ending in 60 days']/../..//h2
    Set Global Variable        ${contact ending in 60days quick filter count}    ${contact ending in 60days quick filter count}
    Wait Until Page Ready
    Log                                  ${contact ending in 60days quick filter count}

validate contact ending in 60days quick filter count
    Wait Until Page Ready
    Wait Until Element Is Visible        //span[@class='k-pager-info']
    Wait Until Page Ready
    ${actual contact ending in 60days quick filter count}=    Get Text    //span[@class='k-pager-info']
    Should Contain    ${actual contact ending in 60days quick filter count}    ${contact ending in 60days quick filter count}
    Log               ${contact ending in 60days quick filter count}
    Log               ${actual contact ending in 60days quick filter count}
    Wait Until Page Ready

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
    Wait Until Page Ready
    ${text}=    Get Text                 //button[@aria-label='views']
    Wait Until Page Ready
    ${newly_created_view}=    Evaluate    '${text}'.strip().lower()
    Wait Until Page Ready
    Set Global Variable      ${newly_created_view}    ${newly_created_view}
    Wait Until Page Ready
    Should Be Equal    ${newly_created_view}      ${view_name}
    Log    ${view_name}
    Wait Until Page Ready
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

make search by talent name
    Wait Until Page Ready
    Wait Until Element Is Visible    //input[contains(@class,'k-input k-i')]
    Wait Until Page Ready
    Input Text               //input[contains(@class,'k-input k-i')]      ${float_pool_talent_name}
    Wait Until Page Ready
    Click Element            //h1[contains(text(),'Float')]
    Wait Until Page Ready

validate only searched talent is displayed
    Wait Until Page Ready
    Wait Until Element Is Visible    //a[@class='vm-left-pane-card-link']
    Wait Until Page Ready
    ${searched_talent_name}=    Get Text    //a[@class='vm-left-pane-card-link']
    Wait Until Page Ready
    ${searched_talent_name}=      Convert To Lowercase    ${searched_talent_name}
    ${float_pool_talent_name}=    Convert To Lowercase    ${float_pool_talent_name}
    Wait Until Page Ready
    Log   >> Searched: ${searched_talent_name} | Float Pool: ${float_pool_talent_name}
    Should Be Equal    ${searched_talent_name}    ${float_pool_talent_name}
    Wait Until Page Ready

open first talent details from talent pool page and store start/end date, location, qualifications in variable
    Wait Until Page Ready
    #start date/ end date
    Wait Until Element Is Visible    //span[@class='icon-event viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    ${floatpool_talent_start_end_date}=     Get Text    //span[@class='icon-event viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    Log                              ${floatpool_talent_start_end_date}
    Set Global Variable              ${floatpool_talent_start_end_date}
    Wait Until Page Ready
    #location
    Wait Until Element Is Visible    //span[@class='icon-location viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    ${floatpool_talent_location}=    Get Text    //span[@class='icon-location viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    Log                               ${floatpool_talent_location}
    Set Global Variable               ${floatpool_talent_location}
    Wait Until Page Ready
    #qualification
    Wait Until Element Is Visible    //span[@class='icon-suitcase viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    ${floatpool_talent_qualification}=        Get Text    //span[@class='icon-suitcase viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    Log                ${floatpool_talent_qualification}
    Set Global Variable               ${floatpool_talent_qualification}    ${floatpool_talent_qualification}


open first talent details from hcs talents page and store start/end date, location, qualifications in variable
    Wait Until Page Ready
    #start date/ end date
    Wait Until Element Is Visible    //span[@class='icon-event viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    ${hcs_talent_start_end_date}=     Get Text    //span[@class='icon-event viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    Log                              ${hcs_talent_start_end_date}
    Set Global Variable              ${hcs_talent_start_end_date}    ${hcs_talent_start_end_date}
    Wait Until Page Ready
    #location
    Wait Until Element Is Visible    //span[@class='icon-location viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    ${hcs_talent_location}=    Get Text    //span[@class='icon-location viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    Log                               ${hcs_talent_location}
    Set Global Variable               ${hcs_talent_location}    ${hcs_talent_location}
    Wait Until Page Ready
    #qualification
    Wait Until Element Is Visible    //span[@class='icon-suitcase viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    ${hcs_talent_qualification}=        Get Text    //span[@class='icon-suitcase viewpage-info-icon']/../..//span[@class=' mb-2 viewpage-info-text']
    Log                ${hcs_talent_qualification}
    Set Global Variable               ${hcs_talent_qualification}       ${hcs_talent_qualification}

Validate Talent Details Match
    ${fp_date}=    Convert To Lowercase    ${floatpool_talent_start_end_date}
    ${hcs_date}=   Convert To Lowercase    ${hcs_talent_start_end_date}
    Should Be Equal    ${fp_date}    ${hcs_date}    Start/end dates do not match

    ${fp_location}=    Convert To Lowercase    ${floatpool_talent_location}
    ${hcs_location}=   Convert To Lowercase    ${hcs_talent_location}
    Should Be Equal    ${fp_location}    ${hcs_location}    Locations do not match

    ${fp_qualification}=    Convert To Lowercase    ${floatpool_talent_qualification}
    ${hcs_qualification}=   Convert To Lowercase    ${hcs_talent_qualification}
    Should Be Equal    ${fp_qualification}    ${hcs_qualification}    Qualifications do not match
    

Validate Miles Are Within 50
    Wait Until Page Ready
    ${cells}=    Get WebElements    //td[@role='gridcell'][contains(.,'miles')]
    ${count}=    Get Length    ${cells}
    Log To Console    >> Found ${count} mile elements
    FOR    ${cell}    IN    @{cells}
        ${text}=    Get Text    ${cell}
        ${matches}=    Get Regexp Matches    ${text}    [0-9.]+
        ${number}=    Get From List    ${matches}    0
        Log To Console    >> Checking miles: ${number}
        Log               >> Checking miles: ${number}
        Should Be True    ${number} <= 50    Value ${number} exceeds 50
    END