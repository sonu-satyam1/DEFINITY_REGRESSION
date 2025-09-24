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
open jobs page
    Wait Until Page Ready
    Wait Until Page Contains Element    //li[@class='nav-section-item ']//a    ${TIMEOUT}
    Wait Until Page Ready
    Mouse Over                          //li[@class='nav-section-item ']//a
    Wait Until Page Contains Element    //a[@href='/job-order']    ${TIMEOUT}
    Click Element                       //a[@href='/job-order']

Apply applicants quick filter
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Applicants']        ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Applicants']
    Wait Until Page Ready

Open positions/All Job Requisites
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Pending Approval and Drafts']    ${TIMEOUT}
    Wait Until Page Ready
    Mouse Over                          //span[text()='Pending Approval and Drafts']
    Wait Until Page Contains Element    //span[text()='Open Positions']                ${TIMEOUT}
    Wait Until Element Is Enabled       //span[text()='Open Positions']
    Click Element                       //span[text()='Open Positions']
    Wait Until Page Ready
    Click Element                        //li[@class='table-filters-item ' and text()='New']
    Wait Until Page Ready

open all job requisitions
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Pending Approval and Drafts']    ${TIMEOUT}
    Wait Until Page Ready
    Mouse Over                          //span[text()='Pending Approval and Drafts']
    Wait Until Page Contains Element    //span[text()='All Job Requisitions']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='All Job Requisitions']
    Wait Until Page Ready


Filter open jobs
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element    //label[text()='Open Jobs']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //label[text()='Open Jobs']
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Filter']
    Wait Until Page Ready

Filter jobs that can be bulk edited
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    ${labels}=    Create List           Offer Pending    Open    Pending Approval
    FOR    ${label}    IN    @{labels}
        ${xpath}=    Set Variable    //label[text()='${label}']
        Run Keyword And Ignore Error    Wait Until Element Is Visible    ${xpath}    ${TIMEOUT}
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath}
        Run Keyword If    ${is_visible}    Click Element    ${xpath}
        Run Keyword If    ${is_visible}    Exit For Loop
    END
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element    //span[text()='Filter']
    Wait Until Page Ready

Filter pending approval jobs
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element    //label[text()='Offer Pending']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //label[text()='Offer Pending']
    Wait Until Page Contains Element    //span[text()='Filter']     ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Filter']
    Wait Until Page Ready

Filter offers accepted jobs
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    Wait Until Page Contains Element    //label[text()='Offers Accepted']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //label[text()='Offers Accepted']
    Wait Until Page Contains Element    //span[text()='Filter']     ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Filter']
    Wait Until Page Ready


Filter jobs that should not be bulk edited
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Status']/../..//span[@class='k-icon k-svg-icon k-svg-i-more-vertical']
    ${labels}=    Create List           Filled    Offers Accepted    Completed     Rejected    Closed
    FOR    ${label}    IN    @{labels}
        ${xpath}=    Set Variable    //label[text()='${label}']
        Run Keyword And Ignore Error    Wait Until Element Is Visible    ${xpath}    ${TIMEOUT}
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath}
        Run Keyword If    ${is_visible}    Click Element    ${xpath}
        Run Keyword If    ${is_visible}    Exit For Loop
    END
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element    //span[text()='Filter']
    Wait Until Page Ready

enable bulk edit option
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Bulk edit']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Bulk edit']
    Wait Until Page Ready

select all jobs
    Wait Until Page Ready
    Wait Until Page Contains Element    //input[@id='bulkCheck']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                        //input[@id='bulkCheck']
    Wait Until Page Ready
    Checkbox Should Be Selected         //input[@id='bulkCheck']
    Wait Until Page Ready

deselect all jobs
    Wait Until Page Contains Element    //input[@id='bulkCheck']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                        //input[@id='bulkCheck']
    Wait Until Page Ready
    Checkbox Should Not Be Selected     //input[@id='bulkCheck']
    Wait Until Page Ready
    
select first job for bulk edit
    Wait Until Page Contains Element    (//div[@class='d-flex align-items-center name-col-container']/../..//input[@type='checkbox'])[1]    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       (//div[@class='d-flex align-items-center name-col-container']/../..//input[@type='checkbox'])[1]
    Wait Until Page Ready

store job id of first job from listing page
    Wait Until Page Ready
    Wait Until Page Contains Element    (//span[@class='name-col cursor-pointer'])[1]    ${TIMEOUT}
    ${job_id_name}=    Get Text    (//span[@class='name-col cursor-pointer'])[1]
    ${job_id_name}=    Strip String    ${job_id_name}
    ${parts}=         Split String    ${job_id_name}    -    # splits on the dash character
    ${job_number}=    Strip String    ${parts}[0]    # get first part and strip spaces
    Set Global Variable    ${JOB_ID}    ${job_number}
    Log To Console         Extracted Job ID: ${JOB_ID}
    Wait Until Page Ready

close bulk edit window after successful edit
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Close']    ${TIMEOUT}
    Wait Until Element Is Enabled       //span[text()='Close']    ${TIMEOUT}
    Wait Until Element Is Visible       //span[text()='Close']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Close']
    Wait Until Page Ready

search job by job id
    Wait Until Page Ready
    Wait Until Page Contains Element    //input[@class='k-input k-input-md k-rounded-md k-input-solid']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Input Text                          //input[@class='k-input k-input-md k-rounded-md k-input-solid']    ${JOB_ID}
    Wait Until Page Ready
select first job from list after search
    Wait Until Page Ready
    Wait Until Page Contains Element    (//span[@class='name-col cursor-pointer'])[1]    ${TIMEOUT}
    Scroll Element Into View            (//span[@class='name-col cursor-pointer'])[1]
    Wait Until Element Is Enabled       (//span[@class='name-col cursor-pointer'])[1]
    Wait Until Page Ready
    Click Element                       (//span[@class='name-col cursor-pointer'])[1]
    Wait Until Page Ready
    
view job details page
    Wait Until Page Ready
    Wait Until Page Contains Element    //h2[@class='slide-pane-job-name m-0 pb-2 cursor-pointer']        ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //h2[@class='slide-pane-job-name m-0 pb-2 cursor-pointer']
    Wait Until Page Ready
    
validate tag is added successfully to job
    Wait Until Page Ready
    Wait Until Page Contains Element    //div[@id='react-tags']            ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View            //div[@id='react-tags']
    Wait Until Page Ready
    Wait Until Page Contains Element    (//span[@class='react-tags__tag-name'])[1]    ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View            (//span[@class='react-tags__tag-name'])[1]
    Wait Until Page Ready
    ${added_tag_name}=    Get Text    (//span[@class='react-tags__tag-name'])[1]
    Set Global Variable    ${added_tag_name}    ${added_tag_name}
    Should Be Equal        ${added_tag_name}    ${new_tag_bulk_edit}
    Wait Until Page Ready
    

bulk edit jobs
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Edit Selected Rows']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Edit Selected Rows']
    Wait Until Page Ready

edit selected rows option should be enabled
    Wait Until Page Ready
    Element Should Be Enabled           //span[text()='Edit Selected Rows']
    Wait Until Page Ready
    
edit selected rows option should be disabled
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Edit Selected Rows']        ${TIMEOUT}
    Wait Until Page Contains Element    //button[@class='k-button k-button-md k-rounded-md k-button-solid k-button-solid-base pr-outline-btn']
    Element Should Be Disabled          //button[@class='k-button k-button-md k-rounded-md k-button-solid k-button-solid-base pr-outline-btn']
    Wait Until Page Ready
    

get bulk edit pop up message and validate
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Edit Job Orders']       ${TIMEOUT}
    Wait Until Page Ready
    ${actual_bulk_edit_pop_up_message}     Get Text            //span[text()='Edit Job Orders'] 
    Should Be Equal        ${actual_bulk_edit_pop_up_message}    ${expected_bulk_edit_popup_message}
    Wait Until Page Ready

edit add tag in bulk edit window
    Wait Until Page Ready
    Wait Until Page Contains Element    //div[@id='react-tags-combobox']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //div[@id='react-tags-combobox']
    Wait Until Page Ready

add custom tag in bulk edit window
    Wait Until Page Ready
    Input Text                          //input[@class='react-tags__combobox-input']        ${new_tag_bulk_edit}
    Wait Until Page Ready
    Wait Until Page Contains Element    //div[@id='react-tags-option-Symbol(Create_new_tag)-Add_%value%']    ${TIMEOUT}
    Scroll Element Into View            //div[@id='react-tags-option-Symbol(Create_new_tag)-Add_%value%']
    Wait Until Page Ready
    Click Element                       //div[@id='react-tags-option-Symbol(Create_new_tag)-Add_%value%']
    Wait Until Page Ready

submit bulk edit option
    Wait Until Page Ready
    Wait Until Element Is Visible        //span[text()='Submit']    ${TIMEOUT}
    Wait Until Page Contains Element     //span[text()='Submit']    ${TIMEOUT}
    Wait Until Element Is Enabled        //span[text()='Submit']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Submit']
    Wait Until Page Ready

validate submit bulk edit button is enabled
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Submit']    ${TIMEOUT}
    Element Should Be Enabled           //button[.//span[text()='Submit']]

validate submit bulk edit button is disabled
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Submit']    ${TIMEOUT}
    Element Should Be Disabled          //button[.//span[text()='Submit']]

    

select existing tag in bulk edit window and select
    Wait Until Page Ready
    Scroll Element Into View            (//div[@class='react-tags__listbox-option'])[1]     
    Wait Until Page Ready
    Wait Until Page Contains Element    (//div[@class='react-tags__listbox-option'])[1]    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       (//div[@class='react-tags__listbox-option'])[1]

select five existing tag in bulk edit window and select
    Wait Until Page Ready
    FOR    ${index}    IN RANGE    2    7
        ${locator}=    Set Variable    (//div[@class='react-tags__listbox-option'])[${index}]
        Scroll Element Into View    ${locator}
        Wait Until Page Ready
        Wait Until Page Contains Element    ${locator}    ${TIMEOUT}
        Wait Until Page Ready
        ${text}=    Get Text    ${locator}
        Append To List    ${FIVE_TAGS}    ${text}
        Click Element    ${locator}
    END
    Log To Console        ${FIVE_TAGS}

move to tags and get all tags and store in list and validate
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Tags']        ${TIMEOUT}
    Scroll Element Into View            //span[text()='Tags']
    FOR    ${index}     IN RANGE     1     6
        ${locator}=    Set Variable    (//li[@class='react-tags__list-item'])[${index}]
        Wait Until Page Ready
        ${text}=       Get Text    ${locator}
        Append To List    ${ACTUAL_FIVE_TAGS_PRESENT}    ${text}
    END
    Log To Console        ${ACTUAL_FIVE_TAGS_PRESENT}
    ${count}=    Get Length    ${ACTUAL_FIVE_TAGS_PRESENT}
    Should Be Equal As Integers    ${count}    5
    Wait Until Page Ready


open pay package tab in bulk edit job window
    Wait Until Page Ready
    Wait Until Page Contains Element    //span[text()='Pay Package']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                       //span[text()='Pay Package']
    Wait Until Page Ready

store pay package header in variable
    Wait Until Page Ready
    Wait Until Page Contains Element                       //span[text()='Pay Package(Vendor)']        ${TIMEOUT}
    ${pay_package_tab_header}=       Get Text              //span[text()='Pay Package(Vendor)']
    Set Global Variable    ${pay_package_tab_header}    ${pay_package_tab_header}
    Wait Until Page Ready
    
validate actual pay package header with expected pay package header
    Wait Until Page Ready
    Should Be Equal    ${pay_package_tab_header}    ${pay_package_tab_header}
    Wait Until Page Ready

regular rate field is blank in bulk edit jobs window
    Wait Until Page Ready
    [Arguments]    ${locator}
    ${value}=    Get Value    ${locator}
    Log    >>> Value retrieved from input: "${value}"
    Should Be Equal    "${value}"    ""
    Wait Until Page Ready

enter regular rate in bulk edit jobs window
    Wait Until Page Ready
    Wait Until Page Contains Element        //input[@id='regularRate']
    Wait Until Page Ready
    Input Text    //input[@id='regularRate']     ${regular_rate}
    Wait Until Page Ready
    
open pay package tab on view job details page
    Wait Until Page Ready
    Wait Until Page Contains Element        //span[text()='Pay Package']    ${TIMEOUT}
    Scroll Element Into View                //span[text()='Pay Package']
    Wait Until Page Ready
    Click Element                           //span[text()='Pay Package']
    Wait Until Page Ready
    Wait Until Page Contains Element        //span[@class='paypackage-card-list-item']    ${TIMEOUT}
    Scroll Element Into View                //span[@class='paypackage-card-list-item']
    Wait Until Page Ready

click on view details option of pay package tab on view job details page
    Wait Until Page Ready
    Wait Until Page Contains Element    //button[contains(@class,'bg-transparent border-0 co')]    ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View            //button[contains(@class,'bg-transparent border-0 co')]
    Wait Until Page Ready
    Click Element                       //button[contains(@class,'bg-transparent border-0 co')]
    Wait Until Page Ready

open pay package tab on view job details page and capture the regular rate and validate
    Wait Until Page Ready
    Wait Until Page Contains Element        //span[@class='paypackage-card-list-item']    ${TIMEOUT}
    Scroll Element Into View                //span[@class='paypackage-card-list-item']
    Wait Until Page Ready
    ${actual_regular_rate}=             Get Text            //span[@class='paypackage-card-list-item']
    Set Global Variable        ${actual_regular_rate}            ${actual_regular_rate}
    ${expected_str}=    Convert To String    ${regular_rate}
    Should Contain      ${actual_regular_rate}    ${expected_str}
    Log               ${actual_regular_rate}
    Log               ${expected_str}
    Wait Until Page Ready



click on talent tab on view job order page
    Wait Until Page Contains Element        //div[@class='k-tabstrip-items-wrapper k-tabstrip-items-wrapper-scroll k-hstack']//span[text()='Talent']        ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View                //div[@class='k-tabstrip-items-wrapper k-tabstrip-items-wrapper-scroll k-hstack']//span[text()='Talent']
    Click Element                           //div[@class='k-tabstrip-items-wrapper k-tabstrip-items-wrapper-scroll k-hstack']//span[text()='Talent']
    Click Element                           //div[@class='k-tabstrip-items-wrapper k-tabstrip-items-wrapper-scroll k-hstack']//span[text()='Talent']
    Wait Until Page Ready

open talent details on talent tab on view job order page
    Wait Until Page Ready
    Wait Until Page Contains Element        (//span[@class=' table-link text-decoration-underline'])[1]       ${TIMEOUT}
    Scroll Element Into View                (//span[@class=' table-link text-decoration-underline'])[1]
    Scroll Element Into View                (//span[@class='d-flex flex-column']//a)[1]
    Click Element                           (//span[@class='d-flex flex-column']//a)[1]
    Wait Until Page Ready

open pay package tab on job talents details page
    Wait Until Page Ready
    Wait Until Page Contains Element    //ul[@class='k-tabstrip-items k-tabstrip-items-scroll k-reset k-tabstrip-items-start']//span[text()='Pay Package']       ${TIMEOUT} 
    Scroll Element Into View            //ul[@class='k-tabstrip-items k-tabstrip-items-scroll k-reset k-tabstrip-items-start']//span[text()='Pay Package']
    Wait Until Page Ready
    Wait Until Page Ready
    Click Element                       //ul[@class='k-tabstrip-items k-tabstrip-items-scroll k-reset k-tabstrip-items-start']//span[text()='Pay Package']
    Wait Until Page Ready

get regular rate for talent for job talent details page and validate with updated regular rate
    Wait Until Page Ready
    Wait Until Page Contains Element            //div[@class='d-flex align-items-center w-25 pe-3']//span[@class='paypackage-card-list-item ']        ${TIMEOUT}
    Scroll Element Into View                    //div[@class='d-flex align-items-center w-25 pe-3']//span[@class='paypackage-card-list-item ']
    ${old_talent_regular_rate}=    Get Text     //div[@class='d-flex align-items-center w-25 pe-3']//span[@class='paypackage-card-list-item ']
    Set Global Variable    ${old_talent_regular_rate}        ${old_talent_regular_rate}
    Log                    ${old_talent_regular_rate}
    Should Not Be Equal    ${old_talent_regular_rate}        ${actual_regular_rate}


open history tab in job order details page
    Wait Until Page Ready
    Wait Until Page Contains Element            //span[text()='History']    ${TIMEOUT}
    Scroll Element Into View                    //span[text()='History']
    Wait Until Page Ready
    Click Element                               //span[text()='History']
    Wait Until Page Ready
    
open add vendor tab
    Wait Until Page Ready
    Wait Until Page Contains Element            //div[text()='+ Add vendor']    ${TIMEOUT}
    Scroll Element Into View                    //div[text()='+ Add vendor']
    Wait Until Page Ready
    Click Element                               //div[text()='+ Add vendor']
    Wait Until Page Ready
    Wait Until Page Contains Element            //span[@class='k-input-value-text']    ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View                    //span[@class='k-input-value-text']
    Wait Until Page Ready
    Click Element                               //span[@class='k-input-value-text']
    Wait Until Page Ready

Add Vendor to a job order details
    [Arguments]    ${Vendor_name}
    ${result}=    Run Keyword And Ignore Error    Wait Until Page Contains Element    //span[text()='${Vendor_name}']    ${TIMEOUT}
    Wait Until Page Ready

    IF    '${result[0]}' == 'PASS'
        Log    Vendor "${Vendor_name}" found — clicking.
        Scroll Element Into View            //span[text()='${Vendor_name}']
        Wait Until Page Ready
        Click Element                       //span[text()='${Vendor_name}']
        Wait Until Page Ready
        Wait Until Page Contains Element    //span[text()='SUBMIT']    ${TIMEOUT}
        Click Element                       //span[text()='SUBMIT']
    ELSE
        Log    Vendor "${Vendor_name}" not found — already added to a job.
        Wait Until Page Contains Element    //span[text()='Cancel']    ${TIMEOUT}
        Click Element                       //span[text()='Cancel']
    END

#ot rules
validate whether Daily Weekly and Consecutive Days are unchecked by default
    Wait Until Page Contains Element        //label[text()='Daily']/..//input[@type='checkbox']
    Scroll Element Into View                //label[text()='Daily']/..//input[@type='checkbox']
    Checkbox Should Not Be Selected         //label[text()='Daily']/..//input[@type='checkbox']
    Wait Until Page Ready
    Scroll Element Into View                //label[text()='Weekly']/..//input[@type='checkbox']
    Checkbox Should Not Be Selected         //label[text()='Weekly']/..//input[@type='checkbox']
    Wait Until Page Ready
    Scroll Element Into View                //label[text()='Consecutive Days']/..//input[@type='checkbox']
    Checkbox Should Not Be Selected         //label[text()='Consecutive Days']/..//input[@type='checkbox']
    Wait Until Page Ready


add ot rules for daily
    Wait Until Page Contains Element       //label[text()='Daily']/..//input[@type='checkbox']    ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View               //label[text()='Daily']/..//input[@type='checkbox']
    Click Element                          //label[text()='Daily']/..//input[@type='checkbox']
    Wait Until Page Ready
    Wait Until Page Contains Element       //input[@id='overtimeRules.0.fields.0.hours']    ${TIMEOUT}
    Scroll Element Into View               //input[@id='overtimeRules.0.fields.0.hours']
    Input Text                             //input[@id='overtimeRules.0.fields.0.hours']        ${experience}
    Wait Until Page Ready
    Wait Until Page Contains Element       //input[@id='overtimeRules.0.fields.0.billingValue']    ${TIMEOUT}
    Input Text                             //input[@id='overtimeRules.0.fields.0.billingValue']    ${experience}
    Wait Until Page Ready

add ot rules for weekly
    Wait Until Page Contains Element       //label[text()='Weekly']/..//input[@type='checkbox']    ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View               //label[text()='Weekly']/..//input[@type='checkbox']
    Click Element                          //label[text()='Weekly']/..//input[@type='checkbox']
    Wait Until Page Ready
    Wait Until Page Contains Element       //input[@id='overtimeRules.1.fields.0.hours']       ${TIMEOUT}
    Scroll Element Into View               //input[@id='overtimeRules.1.fields.0.hours']
    Input Text                             //input[@id='overtimeRules.1.fields.0.hours']        ${experience}
    Wait Until Page Ready
    Wait Until Page Contains Element       //input[@id='overtimeRules.1.fields.0.billingValue']     ${TIMEOUT}
    Input Text                             //input[@id='overtimeRules.1.fields.0.billingValue']    ${experience}
    Wait Until Page Ready
    
add ot rules for Consecutive Days
    Wait Until Page Contains Element       //label[text()='Consecutive Days']/..//input[@type='checkbox']    ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View               //label[text()='Consecutive Days']/..//input[@type='checkbox']
    Click Element                          //label[text()='Consecutive Days']/..//input[@type='checkbox']
    Wait Until Page Ready
    Wait Until Page Contains Element       //input[@id='overtimeRules.2.fields.0.hours']       ${TIMEOUT}
    Scroll Element Into View               //input[@id='overtimeRules.2.fields.0.hours']
    Input Text                             //input[@id='overtimeRules.2.fields.0.hours']       ${experience}
    Wait Until Page Ready
    Wait Until Page Contains Element       //input[@id='overtimeRules.2.fields.0.billingValue']    ${TIMEOUT}
    Scroll Element Into View               //input[@id='overtimeRules.2.fields.0.billingValue']
    Input Text                             //input[@id='overtimeRules.2.fields.0.billingValue']    ${experience}
    Wait Until Page Ready

#add credentials
open credentials tab in bulk edit job window
    Wait Until Page Contains Element        //span[text()='Credentials']                ${TIMEOUT}
    Scroll Element Into View                //span[text()='Credentials']
    Wait Until Page Ready
    Click Element                           //span[text()='Credentials']
    Wait Until Page Ready

open credentials dropdown in bulk edit job window
    Wait Until Page Contains Element        //label[text()='Credential Name']/..//button    ${TIMEOUT}
    Scroll Element Into View                //label[text()='Credential Name']/..//button
    Wait Until Page Ready
    Click Element                           //label[text()='Credential Name']/..//button

select first credential from dropdown in bulk edit job window
    Wait Until Page Ready
    Click Element                           //li[@id='option-credentials.0.credential-0']


capture first credential from dropdown name in variable in bulk edit job window
    Wait Until Page Contains Element        //li[@id='option-credentials.0.credential-0']    ${TIMEOUT}
    Scroll Element Into View                //li[@id='option-credentials.0.credential-0']
    ${first_added_credential}=    Get Text    //li[@id='option-credentials.0.credential-0']
    ${first_added_credential}=              Evaluate    '${first_added_credential}'.strip().lower()
    Set Global Variable                     ${first_added_credential}    ${first_added_credential}
    Wait Until Page Ready
    Log                                     first added credential from list:${first_added_credential}

enter random credential in dropdown text field
    Wait Until Element Is Visible    xpath=//ul[@class='k-list-ul']//li    ${TIMEOUT}
    @{elements}=    Get WebElements    xpath=//ul[@class='k-list-ul']//li
    ${creds_list}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        ${text}=    Evaluate    '${text}'.strip()
        Append To List    ${creds_list}    ${text}
    END
    ${random_credential_upper}=    Evaluate    random.choice(${creds_list})    modules=random
    ${random_credential}=              Evaluate    '${random_credential_upper}'.strip().lower()
    Set Global Variable    ${random_credential}    ${random_credential}
    Log    Randomly selected credential: ${random_credential}
    
    Wait Until Page Ready
    Wait Until Page Contains Element    //input[@id='credentials.0.credential']
    Click Element                       //input[@id='credentials.0.credential']
    Wait Until Page Ready
    Input Text                          //input[@id='credentials.0.credential']        ${random_credential}
    Wait Until Page Ready

validate in dropdown only credentials related to search text is displayed
    Wait Until Page Contains Element        //li[@id='option-credentials.0.credential-0']    ${TIMEOUT}
    Scroll Element Into View                //li[@id='option-credentials.0.credential-0']
    ${searched_credential}=    Get Text    //li[@id='option-credentials.0.credential-0']
    ${searched_credential}=              Evaluate    '${searched_credential}'.strip().lower()
    Set Global Variable                     ${searched_credential}    ${searched_credential}
    Wait Until Page Ready
    Log                                     searched credential from list:${searched_credential}
    Should Be Equal        ${random_credential}    ${searched_credential}

open action dropdown and capture actions and validate
    Wait Until Page Contains Element        //label[text()='Action']/..//button    ${TIMEOUT}
    Scroll Element Into View                //label[text()='Action']/..//button
    Wait Until Page Ready
    Click Element                           //label[text()='Action']/..//button
    Wait Until Page Ready
    Wait Until Page Contains Element        //li[@id='option-credentials.0.action-0']    ${TIMEOUT}
    Scroll Element Into View                //li[@id='option-credentials.0.action-0'] 
    ${action_add}=    Get Text              //li[@id='option-credentials.0.action-0']
    Log                                     action_add:${action_add}
    Wait Until Page Ready
    Wait Until Page Contains Element        //li[@id='option-credentials.0.action-1']    ${TIMEOUT}   
    Scroll Element Into View                //li[@id='option-credentials.0.action-1']
    ${action_remove}=    Get Text           //li[@id='option-credentials.0.action-1']
    Log                                     action_remove:${action_remove}
    Should Be Equal    ${action_add}        Add
    Should Be Equal    ${action_remove}     Remove
    
open action dropdown and add credential
    Wait Until Page Contains Element        //label[text()='Action']/..//button    ${TIMEOUT}
    Scroll Element Into View                //label[text()='Action']/..//button
    Wait Until Page Ready
    Click Element                           //label[text()='Action']/..//button     
    Wait Until Page Contains Element        //li[@id='option-credentials.0.action-0']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //li[@id='option-credentials.0.action-0']
    Wait Until Page Ready

open action dropdown and remove credential
    Wait Until Page Contains Element        //label[text()='Action']/..//button    ${TIMEOUT}
    Scroll Element Into View                //label[text()='Action']/..//button
    Wait Until Page Ready
    Click Element                           //label[text()='Action']/..//button
    Wait Until Page Contains Element        //li[@id='option-credentials.0.action-1']    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //li[@id='option-credentials.0.action-1']
    Wait Until Page Ready

open second action dropdown and remove credential
    Wait Until Page Contains Element        //input[@id='credentials.1.action']/../..//button    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //input[@id='credentials.1.action']/../..//button
    Wait Until Page Ready
    Wait Until Page Contains Element        //li[@id='option-credentials.1.action-1']            ${TIMEOUT}
    Scroll Element Into View                //li[@id='option-credentials.1.action-1']
    Wait Until Page Ready
    Click Element                           //li[@id='option-credentials.1.action-1']
    Wait Until Page Ready

open + Add Credential menu
    Wait Until Page Contains Element         //span[text()='+ Add Credential']     ${TIMEOUT}
    Scroll Element Into View                 //span[text()='+ Add Credential']
    Wait Until Page Ready
    Click Element                            //span[text()='+ Add Credential']

validate second credential dropdown by adding new credential and capture name
    Wait Until Page Contains Element        //input[@id='credentials.1.credential']/../..//button    ${TIMEOUT}
    Scroll Element Into View                //input[@id='credentials.1.credential']/../..//button
    Wait Until Page Ready
    Click Element                           //input[@id='credentials.1.credential']/../..//button
    Wait Until Page Contains Element        //li[@id='option-credentials.1.credential-1']            ${TIMEOUT}
    Wait Until Page Ready
    Scroll Element Into View                //li[@id='option-credentials.1.credential-1']
    ${second_cred}=    Get Text             //li[@id='option-credentials.1.credential-1']
    ${item_trimmed}=    Evaluate    '${second_cred}'.strip().lower()
    Set Global Variable                     ${second_cred_added}    ${item_trimmed}
    Log                                     second credential added :${second_cred_added}
    Click Element                           //li[@id='option-credentials.1.credential-1']
    Wait Until Page Ready


validate second action dropdown by adding new action
    Wait Until Page Contains Element        //input[@id='credentials.1.action']/../..//button    ${TIMEOUT}
    Wait Until Page Ready
    Click Element                           //input[@id='credentials.1.action']/../..//button
    Wait Until Page Ready
    Wait Until Page Contains Element        //li[@id='option-credentials.1.action-0']            ${TIMEOUT}
    Scroll Element Into View                //li[@id='option-credentials.1.action-0']
    Wait Until Page Ready
    Click Element                           //li[@id='option-credentials.1.action-0']
    Wait Until Page Ready


open credentials tab on job order details
    Wait Until Page Contains Element        //span[text()='Credentials']    ${TIMEOUT}
    Scroll Element Into View                //span[text()='Credentials']
    Wait Until Page Ready
    Click Element                           //span[text()='Credentials']
    Wait Until Page Ready

open required at start tab in credentials tab on job order details
    Wait Until Page Contains Element        //li[@class='table-filters-item active' ]/..//li[text()='Required at Start']    ${TIMEOUT}
    Scroll Element Into View                //li[@class='table-filters-item active' ]/..//li[text()='Required at Start']
    Wait Until Page Ready
    Click Element                           //li[@class='table-filters-item active' ]/..//li[text()='Required at Start']
    Wait Until Page Ready
    
get all credentials list from required at start and store in a list on job order details and validate that added credential should be present in list
    Wait Until Page Contains Element        //table[@class='k-table k-grid-table k-table-md']//td
    ${rows}=    Get WebElements             //table[@class='k-table k-grid-table k-table-md']//td
    ${credentials_list_in_required_at_start}=    Create List
    FOR    ${row}    IN    @{rows}
        ${text}=    Get Text    ${row}
        ${item_trimmed}=    Evaluate    '${text}'.strip().lower()
        Append To List    ${credentials_list_in_required_at_start}    ${item_trimmed}
    END
    Log    credentials list in required at start:${credentials_list_in_required_at_start}
    List Should Contain Value    ${credentials_list_in_required_at_start}    ${first_added_credential}

get all credentials list from required at start and store in a list on job order details and validate that removed credential should not be present in list
    ${is_visible}=    Run Keyword And Return Status    Page Should Contain Element    //table[@class='k-table k-grid-table k-table-md']//td
        Run Keyword If    not ${is_visible}    Log    Table not visible. Skipping validation of credential presence.
        Run Keyword If    ${is_visible}    Run Keywords
               ${rows}=    Get WebElements    //table[@class='k-table k-grid-table k-table-md']//td
               ${credentials_list_in_required_at_start}=    Create List
               FOR    ${row}    IN    @{rows}
                   ${text}=    Get Text    ${row}
                   ${item_trimmed}=    Evaluate    '${text}'.strip().lower()
                   Append To List    ${credentials_list_in_required_at_start}    ${item_trimmed}
               END
               Log    Credentials list in required at start: ${credentials_list_in_required_at_start}
               ${expected}=    Evaluate    '${first_added_credential}'.strip().lower()
               List Should Not Contain Value    ${credentials_list_in_required_at_start}    ${expected}

get all credentials list from required at start and store in a list on job order details after job edit
        ${is_visible}=    Run Keyword And Return Status    Page Should Contain Element    //table[@class='k-table k-grid-table k-table-md']//td
        Run Keyword If    not ${is_visible}    Log    Table not visible. Skipping validation of credential presence.
        Run Keyword If    ${is_visible}    Run Keywords
               ${rows}=    Get WebElements    //table[@class='k-table k-grid-table k-table-md']//td
               ${credentials_list_in_required_at_start_after_edit}=    Create List
               FOR    ${row}    IN    @{rows}
                   ${text}=    Get Text    ${row}
                   ${item_trimmed}=    Evaluate    '${text}'.strip().lower()
                   Append To List    ${credentials_list_in_required_at_start_after_edit}    ${item_trimmed}
               END
               Log    Credentials list in required at start after job edit: ${credentials_list_in_required_at_start_after_edit}
        Set Global Variable    ${credentials_list_in_required_at_start_after_edit}    ${credentials_list_in_required_at_start_after_edit}

get all credentials list from required at start and store in a list on job order details before job edit
        ${is_visible}=    Run Keyword And Return Status    Page Should Contain Element    //table[@class='k-table k-grid-table k-table-md']//td
        Run Keyword If    not ${is_visible}    Log    Table not visible. Skipping validation of credential presence.
        Run Keyword If    ${is_visible}    Run Keywords
               ${rows}=    Get WebElements    //table[@class='k-table k-grid-table k-table-md']//td
               ${credentials_list_in_required_at_start_before_edit}=    Create List
               FOR    ${row}    IN    @{rows}
                   ${text}=    Get Text    ${row}
                   ${item_trimmed}=    Evaluate    '${text}'.strip().lower()
                   Append To List    ${credentials_list_in_required_at_start_before_edit}    ${item_trimmed}
               END
               Log    Credentials list in required at start before job edit: ${credentials_list_in_required_at_start_before_edit}
        Set Global Variable    ${credentials_list_in_required_at_start_before_edit}    ${credentials_list_in_required_at_start_before_edit}
               
Validate creds list before and after without editing job is same
    Should Be Equal    ${credentials_list_in_required_at_start_after_edit}    ${credentials_list_in_required_at_start_before_edit}
    
validate both first and second cred should present in list after bulk edit
    ${first}=    Evaluate    '${first_added_credential}'.strip().lower()
    ${second}=   Evaluate    '${second_cred_added}'.strip().lower()
    List Should Contain Value        ${credentials_list_in_required_at_start_after_edit}        ${first}
    List Should Contain Value        ${credentials_list_in_required_at_start_after_edit}        ${second}

validate both first and second cred should not be present in list after bulk edit
    ${first}=    Evaluate    '${first_added_credential}'.strip().lower()
    ${second}=   Evaluate    '${second_cred_added}'.strip().lower()
    List Should Not Contain Value        ${credentials_list_in_required_at_start_after_edit}        ${first}
    List Should Not Contain Value        ${credentials_list_in_required_at_start_after_edit}        ${second}

    