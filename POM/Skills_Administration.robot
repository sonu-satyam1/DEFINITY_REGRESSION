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
open settings
    Sleep                                ${WAIT_TIME}
    Wait Until Page Contains Element    //li[@class='nav-section-item active']//a    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    Mouse Over                          //li[@class='nav-section-item active']//a
    Wait Until Page Contains Element    //a[@href='/settings']    ${TIMEOUT}
    Click Element                       //a[@href='/settings']
    Sleep                               ${WAIT_TIME}

open skills administration
    Wait Until Page Contains Element    //a[text()='Skills Administration']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    Mouse Over                          //a[text()='Skills Administration']
    Wait Until Page Contains Element    //a[text()='Skills Administration']    ${TIMEOUT}
    Click Element                       //a[text()='Skills Administration']
    Sleep                               ${WAIT_TIME}

open add skill window
    Wait Until Page Contains Element    //span[text()='Add Skill']    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    Mouse Over                          //span[text()='Add Skill']
    Wait Until Page Contains Element    //span[text()='Add Skill']    ${TIMEOUT}
    Click Element                       //span[text()='Add Skill']
    Sleep                               ${WAIT_TIME}

enter skill name in add skill window
    Wait Until Page Contains Element    //input[@name='name']
    Input Text                          //input[@name='name']        ${newly_added_skill}
    Sleep                               ${WAIT_TIME}


Select Valid Skill Category For Skill Type
    ${category_index}=    Set Variable    1
    WHILE    True
        Log    Trying Skill Category index: ${category_index}
        # Open skill category dropdown
        Wait Until Page Contains Element    //input[@id='skillCategory']/..//button[contains(@class,'k')]    ${TIMEOUT}
        Click Element                       //input[@id='skillCategory']/..//button[contains(@class,'k')]
        Sleep                               ${WAIT_TIME}
        ${category_xpath}=    Set Variable    (//span[@class='k-list-item-text'])[${category_index}]
        ${cat_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${category_xpath}    timeout=3s
        Run Keyword If    not ${cat_found}    Log    No more categories found. Exiting with failure.
        Run Keyword If    not ${cat_found}    Fail    Could not find a valid skill type for any skill category.
        Click Element    ${category_xpath}
        Sleep            ${WAIT_TIME}
    # Open skill type dropdown
        Wait Until Page Contains Element    //input[@id='skillType']/..//button                              ${TIMEOUT}
        Click Element                       //input[@id='skillType']/..//button
        Sleep                               ${WAIT_TIME}
        ${skill_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    //li[@id='option-skillType-0']    timeout=3s
        Run Keyword If    ${skill_found}    Click Element    //li[@id='option-skillType-0']
        Run Keyword If    ${skill_found}    Log    Skill type selected successfully with category index ${category_index}
        Run Keyword If    ${skill_found}    Exit For Loop
        ${category_index}=    Evaluate    ${category_index} + 1
    END

select valid hiring process
    #open hiring process dropdown option
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //input[@id='hiringProcess']/..//button                ${TIMEOUT}
    Click Element                           //input[@id='hiringProcess']/..//button
    #select first option from dropdown
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //li[@id='option-hiringProcess-0']                     ${TIMEOUT}
    Click Element                           //li[@id='option-hiringProcess-0']
    
enter onboarding message details
    Scroll Element Into View                //textarea[@name='onboardingMessage']
    Wait Until Page Contains Element        //textarea[@name='onboardingMessage']                 ${TIMEOUT}
    Input Text                              //textarea[@name='onboardingMessage']        ${onboardingMessage}
    Sleep                                   ${WAIT_TIME}

upload document while adding skill
    #open document upload window
    Scroll Element Into View                //span[@role='button' and text()='+ Add Attachment'] 
    Wait Until Page Contains Element        //span[@role='button' and text()='+ Add Attachment']        ${TIMEOUT}
    Click Element                           //span[@role='button' and text()='+ Add Attachment']
    Sleep                                   ${WAIT_TIME}
    #upload document
    Choose File                             //input[@type='file']   ${FILE}
    Sleep                                   ${WAIT_TIME}
    Scroll Element Into View                //div[@class='pr-form-btn-group d-flex justify-content-end mt-40 pe-2']//span[text()='Save']
    Wait Until Page Contains Element        //div[@class='pr-form-btn-group d-flex justify-content-end mt-40 pe-2']//span[text()='Save']        ${TIMEOUT}
    Sleep                                   ${WAIT_TIME}
    Click Element                           //div[@class='pr-form-btn-group d-flex justify-content-end mt-40 pe-2']//span[text()='Save']
    Sleep                                   ${WAIT_TIME}


enable skill assessment required checkbox while adding skill
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //input[@name='assessmentRequired' and @type='checkbox']    ${TIMEOUT}
    Scroll Element Into View                //input[@name='assessmentRequired' and @type='checkbox']       
    Sleep                                   ${WAIT_TIME}
    Click Element                           //input[@name='assessmentRequired' and @type='checkbox']
    Sleep                                   ${WAIT_TIME}
    Scroll Element Into View                //label[text()='Skill Assessment Template']

validate skill assessment required checkbox is unchecked
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //input[@name='assessmentRequired' and @type='checkbox']    ${TIMEOUT}
    Scroll Element Into View                //input[@name='assessmentRequired' and @type='checkbox']
    Checkbox Should Not Be Selected         //input[@name='assessmentRequired' and @type='checkbox']
    Sleep                                   ${WAIT_TIME}

    

Select One Skill Assessment From List of skill type
    Sleep                                   ${WAIT_TIME}
    # Wait for and scroll to the multi-select
    Wait Until Element Is Visible           //div[contains(@class, 'k-multiselect')]         ${TIMEOUT}
    Scroll Element Into View                //div[contains(@class, 'k-multiselect')]
    Sleep                                   ${WAIT_TIME}
    # Click to open the dropdown
    Click Element                           //div[contains(@class, 'k-multiselect')]
    Sleep                                   ${WAIT_TIME}
    # Type into the inner input
    Input Text                              //div[contains(@class, 'k-multiselect')]//input[contains(@class, 'k-input-inner')]    skill
    Sleep                                   ${WAIT_TIME}
    # Wait for dropdown items to appear and click the first one
    Wait Until Element Is Visible            (//li[@class='k-list-item'])[1]    ${TIMEOUT}
    ${raw_text}=    Get Text                 (//li[@class='k-list-item'])[1]
    ${clean_text}=  Evaluate                '''${raw_text}'''.strip().lower()
    Set Global Variable                       ${first_skill_assessment_template}    ${clean_text}
    Log                                      Cleaned text: ${first_skill_assessment_template}
    Click Element                           (//li[@class='k-list-item'])[1]
    Sleep                                   ${WAIT_TIME}


select one test type assessment from the list
    # Type into the inner input
    Input Text                              //div[contains(@class, 'k-multiselect')]//input[contains(@class, 'k-input-inner')]    test
    Sleep                                   ${WAIT_TIME}
    # Wait for dropdown items to appear and click the first one
    Wait Until Element Is Visible            (//li[@class='k-list-item'])[1]    ${TIMEOUT}
    ${raw_text}=    Get Text                 (//li[@class='k-list-item'])[1]
    ${clean_text}=  Evaluate                '''${raw_text}'''.strip().lower()
    Set Global Variable                       ${second_skill_assessment_template}    ${clean_text}
    Log                                      Cleaned text: ${second_skill_assessment_template}
    Click Element                           (//li[@class='k-list-item'])[1]
    Sleep                                   ${WAIT_TIME}

select all assessment templates from the dropdown list
    Sleep                                   ${WAIT_TIME}
    # Wait for and scroll to the multi-select
    Wait Until Element Is Visible           //div[contains(@class, 'k-multiselect')]         ${TIMEOUT}
    Scroll Element Into View                //div[contains(@class, 'k-multiselect')]
    Sleep                                   ${WAIT_TIME}
    # Click to open the dropdown
    Click Element                           //div[contains(@class, 'k-multiselect')]
    Sleep                                   ${WAIT_TIME}
    #click on all options and store in list
    Wait Until Page Contains Element    //li[@class='k-list-item']    ${TIMEOUT}
    @{list_items}=    Get WebElements    //li[@class='k-list-item']
    @{all_templates}=    Create List
    FOR    ${item}    IN    @{list_items}
        Scroll Element Into View    ${item}
        ${text}=    Get Text    ${item}
        Log    Clicking: ${text}
        Append To List    ${all_templates}    ${text.strip()}
        Click Element    ${item}
        Sleep    1
    END
    Log List    @{all_templates}
    # store as global variable
    Set Global Variable    @{all_templates}
    END

validate save button is disabled
    Wait Until Page Contains Element        //button[.//span[text()='Save']]
    Sleep                                   ${WAIT_TIME}
    Element Should Be Disabled              //button[.//span[text()='Save']]
    Sleep                                   ${WAIT_TIME}
    
validate save button is enabled
    Wait Until Page Contains Element        //button[.//span[text()='Save']]
    Sleep                                   ${WAIT_TIME}
    Element Should Be Enabled               //button[.//span[text()='Save']]
    Sleep                                   ${WAIT_TIME}

click on save button on add skill window
    Wait Until Page Contains Element        //span[text()='Save' and @class='k-button-text']                    ${TIMEOUT}
    Sleep                                   ${WAIT_TIME}
    Click Element                           //span[text()='Save' and @class='k-button-text']
    Sleep                                   ${WAIT_TIME}

search for newly created skill and validate the skill assessment templated added and validate for 2 template
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //span[@class='k-floating-label-container k-empty']    ${TIMEOUT}
    Click Element                           //span[@class='k-floating-label-container k-empty']
    Wait Until Page Contains Element        //input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Input Text                              //input[@class='k-input k-input-md k-rounded-md k-input-solid']        ${newly_added_skill}
    Sleep                                   ${WAIT_TIME}
    #skill name
    Wait Until Page Contains Element        //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Click Element                           //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Sleep                                   ${WAIT_TIME}
    #collect skill template name in list
    Wait Until Page Contains Element        //div[contains(@class,'k-m')]    ${TIMEOUT}
    Scroll Element Into View                //div[contains(@class,'k-m')]
    @{km_elements}=    Get WebElements      //div[@class='k-chip k-chip-md k-rounded-md k-chip-solid k-chip-solid-base']
    @{actual_skill_assessment_templates}=    Create List     # Always initialize this way!
    FOR    ${el}    IN    @{km_elements}
        ${raw}=       Get Text    ${el}
        ${clean}=     Evaluate    '''${raw.replace("\\n", " ").strip().lower()}'''
        Append To List    ${actual_skill_assessment_templates}    ${clean}
    END
    #Debug: check type to confirm it's a real list
    Log    Type of list: ${actual_skill_assessment_templates.__class__}
    # Convert list to scalar for proper logging
    ${template_list}=    Create List    @{actual_skill_assessment_templates}
    # Log all items in the list
    Log List    ${template_list}
    ${count}=    Get Length    ${template_list}
    Log    Total templates found: ${count}
    List Should Contain Value        ${template_list}    ${second_skill_assessment_template}
    List Should Contain Value        ${template_list}    ${first_skill_assessment_template}

search for newly created skill and validate the skill assessment templated added and validate for 1 template
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //span[@class='k-floating-label-container k-empty']    ${TIMEOUT}
    Click Element                           //span[@class='k-floating-label-container k-empty']
    Wait Until Page Contains Element        //input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Input Text                              //input[@class='k-input k-input-md k-rounded-md k-input-solid']        ${newly_added_skill}
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Click Element                           //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Sleep                                   ${WAIT_TIME}
    #collect skill template name in list
    Wait Until Page Contains Element        //div[contains(@class,'k-m')]    ${TIMEOUT}
    Scroll Element Into View                //div[contains(@class,'k-m')]
    @{km_elements}=    Get WebElements      //div[@class='k-chip k-chip-md k-rounded-md k-chip-solid k-chip-solid-base']
    @{actual_skill_assessment_templates}=    Create List     # Always initialize this way!
    FOR    ${el}    IN    @{km_elements}
        ${raw}=       Get Text    ${el}
        ${clean}=     Evaluate    '''${raw.replace("\\n", " ").strip().lower()}'''
        Append To List    ${actual_skill_assessment_templates}    ${clean}
    END
    #Debug: check type to confirm it's a real list
    Log    Type of list: ${actual_skill_assessment_templates.__class__}
    # Convert list to scalar for proper logging
    ${template_list}=    Create List    @{actual_skill_assessment_templates}
    # Log all items in the list
    Log List    ${template_list}
    ${count}=    Get Length    ${template_list}
    Log    Total templates found: ${count}
    List Should Contain Value        ${template_list}    ${first_skill_assessment_template}


search for newly created skill and validate the name added and validate without skill template added
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //span[@class='k-floating-label-container k-empty']    ${TIMEOUT}
    Click Element                           //span[@class='k-floating-label-container k-empty']
    Wait Until Page Contains Element        //input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Input Text                              //input[@class='k-input k-input-md k-rounded-md k-input-solid']        ${newly_added_skill}
    Sleep                                   ${WAIT_TIME}
    #skill name
    Wait Until Page Contains Element        //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Sleep                                   ${WAIT_TIME}
    ${actual_skill_name}=    Get Text       //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Log                                     ${actual_skill_name}
    Log                                     ${newly_added_skill}
    Should Be Equal                         ${actual_skill_name}        ${newly_added_skill}
    Sleep                                   ${WAIT_TIME}   

    
search for newly created skill and edit
    #search for newly create skill
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //span[@class='k-floating-label-container k-empty']    ${TIMEOUT}
    Click Element                           //span[@class='k-floating-label-container k-empty']
    Wait Until Page Contains Element        //input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Input Text                              //input[@class='k-input k-input-md k-rounded-md k-input-solid']        ${newly_added_skill}
    Sleep                                   ${WAIT_TIME}
    #open skill details window
    Wait Until Page Contains Element        //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Click Element                           //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Sleep                                   ${WAIT_TIME}
    #click on edit
    Wait Until Page Contains Element        //span[text()='Edit']
    Scroll Element Into View                //span[text()='Edit']
    Sleep                                   ${WAIT_TIME}
    Click Element                           //span[text()='Edit']
    Sleep                                   ${WAIT_TIME}
    

Validate the skill after editing that the skill assessment templated gets added for 1 template
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Click Element                           //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Sleep                                   ${WAIT_TIME}
    #collect skill template name in list
    Wait Until Page Contains Element        //div[contains(@class,'k-m')]    ${TIMEOUT}
    Scroll Element Into View                //div[contains(@class,'k-m')]
    @{km_elements}=    Get WebElements      //div[@class='k-chip k-chip-md k-rounded-md k-chip-solid k-chip-solid-base']
    @{actual_skill_assessment_templates}=    Create List     # Always initialize this way!
    FOR    ${el}    IN    @{km_elements}
        ${raw}=       Get Text    ${el}
        ${clean}=     Evaluate    '''${raw.replace("\\n", " ").strip().lower()}'''
        Append To List    ${actual_skill_assessment_templates}    ${clean}
    END
    #Debug: check type to confirm it's a real list
    Log    Type of list: ${actual_skill_assessment_templates.__class__}
    # Convert list to scalar for proper logging
    ${template_list}=    Create List    @{actual_skill_assessment_templates}
    # Log all items in the list
    Log List    ${template_list}
    ${count}=    Get Length    ${template_list}
    Log    Total templates found: ${count}
    List Should Contain Value        ${template_list}    ${first_skill_assessment_template}


Validate the skill after editing that the skill assessment templated gets added for 2 or more templates
    Sleep                                   ${WAIT_TIME}
    #skill name
    Wait Until Page Contains Element        //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Click Element                           //tr[@class='k-table-row k-master-row']//span[contains(@class,'name-col ')]
    Sleep                                   ${WAIT_TIME}
    #collect skill template name in list
    Wait Until Page Contains Element        //div[contains(@class,'k-m')]    ${TIMEOUT}
    Scroll Element Into View                //div[contains(@class,'k-m')]
    @{km_elements}=    Get WebElements      //div[@class='k-chip k-chip-md k-rounded-md k-chip-solid k-chip-solid-base']
    @{actual_skill_assessment_templates}=    Create List     # Always initialize this way!
    FOR    ${el}    IN    @{km_elements}
        ${raw}=       Get Text    ${el}
        ${clean}=     Evaluate    '''${raw.replace("\\n", " ").strip().lower()}'''
        Append To List    ${actual_skill_assessment_templates}    ${clean}
    END
    #Debug: check type to confirm it's a real list
    Log    Type of list: ${actual_skill_assessment_templates.__class__}
    # Convert list to scalar for proper logging
    ${template_list}=    Create List    @{actual_skill_assessment_templates}
    # Log all items in the list
    Log List    ${template_list}
    ${count}=    Get Length    ${template_list}
    Log    Total templates found: ${count}
    List Should Contain Value        ${template_list}    ${second_skill_assessment_template}
    List Should Contain Value        ${template_list}    ${first_skill_assessment_template}

search for newly created skill and validate the "Assessment Required" and "Assessment template" value in column
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //span[@class='k-floating-label-container k-empty']    ${TIMEOUT}
    Click Element                           //span[@class='k-floating-label-container k-empty']
    Wait Until Page Contains Element        //input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Input Text                              //input[@class='k-input k-input-md k-rounded-md k-input-solid']        ${newly_added_skill}
    Sleep                                   ${WAIT_TIME}
    #validate assessment template name column
    Wait Until Page Contains Element        //td[@class='talent-skillcell']
    Sleep                                   ${WAIT_TIME}
    ${actual_skill_assessment_template}=    Get Text       //td[@class='talent-skillcell']
    ${clean_text}=  Evaluate                '''${actual_skill_assessment_template}'''.strip().lower()
    ${Assessment Required}                  Get Text       //td[@class='k-table-td' and @aria-colindex='7'] 
    Should Be Equal        ${Assessment Required}          Yes
    Log                                     ${clean_text}
    Log                                     ${first_skill_assessment_template} 
    Should Be Equal                         ${clean_text}       ${first_skill_assessment_template}
    Sleep                                   ${WAIT_TIME}
    
    
search for newly created skill without skill assessment and validate the "Assessment Required" and "Assessment template" value in column
    Sleep                                   ${WAIT_TIME}
    Wait Until Page Contains Element        //span[@class='k-floating-label-container k-empty']    ${TIMEOUT}
    Click Element                           //span[@class='k-floating-label-container k-empty']
    Wait Until Page Contains Element        //input[@class='k-input k-input-md k-rounded-md k-input-solid']
    Input Text                              //input[@class='k-input k-input-md k-rounded-md k-input-solid']        ${newly_added_skill}
    Sleep                                   ${WAIT_TIME}
    #validate assessment template name column
    Wait Until Page Contains Element        //td[@class='talent-skillcell']
    Sleep                                   ${WAIT_TIME}
    ${actual_skill_assessment_template}=    Get Text       //td[@class='talent-skillcell']
    ${Assessment Required}                  Get Text       //td[@class='k-table-td' and @aria-colindex='7'] 
    Should Be Equal        ${Assessment Required}          No
    Log                                     ${actual_skill_assessment_template}
    Should Be Equal        ${actual_skill_assessment_template}    -
    Sleep                                   ${WAIT_TIME}