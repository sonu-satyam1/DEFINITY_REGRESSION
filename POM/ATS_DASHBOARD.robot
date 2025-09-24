*** Settings ***
Documentation    Definity
Library          SeleniumLibrary
Library          ScreenCapLibrary
Resource         ../Resources/resource.robot
Library    OperatingSystem
Library    Collections

*** Keywords ***
validate job actions header and below links
     ${expected below links} =    Create List    Jobs With No Candidates   Hot Jobs
     ${expected header header}=    Set Variable    Job Actions
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element   //h2[text()='Job Actions']     ${TIMEOUT}
    ${actual header}    Get Text      //h2[text()='Job Actions']
    Wait Until Page Contains Element        //div[@class='quick-link-card-body ']//a[@class='quick-link-card-link m-0']    ${TIMEOUT}
    ${below links}    Get Webelements    //div[@class='quick-link-card-body ']//a[@class='quick-link-card-link m-0']
     ${actual_below_links} =    Create List
    FOR    ${link}    IN    @{below_links}
        ${text} =    Get Text    ${link}
        Append To List    ${actual_below_links}    ${text}
    END

    Should Be Equal      ${expected below links}       ${actual_below_links}
    Should Be Equal      ${expected header header}      ${actual header}


validate job actions_jobs with no candidates
#    get dashboard value
    Wait Until Page Contains Element    //a[text()='Jobs With No Candidates']/../../..//strong    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${dashboard jobs with no candidates}    Get Text    //a[text()='Jobs With No Candidates']/../../..//strong
    Wait Until Page Contains Element    //a[text()='Jobs With No Candidates']        ${TIMEOUT}
    Click Element    //a[text()='Jobs With No Candidates']
#    get job orders value
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //p[text()='No Candidates']/..//h2    ${TIMEOUT}
    ${job orders jobs with no candidates}    Get Text        //p[text()='No Candidates']/..//h2
    Log To Console        ${job orders jobs with no candidates}
    Log To Console    ${dashboard jobs with no candidates}
    Should Be Equal       ${dashboard jobs with no candidates}      ${job orders jobs with no candidates}
validate job actions_hots jobs
#    get dashboard value
    Wait Until Page Contains Element    //a[text()='Hot Jobs']/../../..//strong    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${dashboard_hot jobs}    Get Text    //a[text()='Hot Jobs']/../../..//strong
    Wait Until Page Contains Element    //a[text()='Hot Jobs']       ${TIMEOUT}
    Click Element    //a[text()='Hot Jobs']
#    get job orders value
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //p[text()='Hot Jobs']/..//h2        ${TIMEOUT}
    ${job orders_hot jobs}    Get Text        //p[text()='Hot Jobs']/..//h2
    Log To Console        ${job orders_hot jobs}
    Log To Console    ${dashboard_hot jobs}
    Should Be Equal       ${dashboard_hot jobs}      ${job orders_hot jobs}

validate talent actions header and below links
     ${expected below links} =    Create List    Pending Start   Pending Offers    Cleared to Start    Contracts Ending (next 30 days)
     ${expected header header}=    Set Variable    Talent Actions
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element   //h2[text()='Talent Actions']     ${TIMEOUT}
    ${actual header}    Get Text    //h2[text()='Talent Actions']
    Wait Until Page Contains Element        (//div[@class='col-4 ats-card-col ats-quick-link-col'])[2]//a    ${TIMEOUT}
    ${below links}    Get Webelements    (//div[@class='col-4 ats-card-col ats-quick-link-col'])[2]//a
     ${actual_below_links} =    Create List
    FOR    ${link}    IN    @{below_links}
        ${text} =    Get Text    ${link}
        Append To List    ${actual_below_links}    ${text}
    END

    Should Be Equal      ${expected below links}       ${actual_below_links}
    Should Be Equal      ${expected header header}      ${actual header}
    Log To Console       ${actual_below_links}
    Log To Console       ${actual header}

validate talent actions_pending start
    #    get dashboard value
    Wait Until Page Contains Element    //a[text()='Pending Start']/../../..//strong    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${dashboard_pending start}    Get Text    //a[text()='Pending Start']/../../..//strong
    Wait Until Page Contains Element    //a[text()='Pending Start']       ${TIMEOUT}
    Click Element        //a[text()='Pending Start']
#    get talent management value
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //p[text()='Pending Start']/..//h2        ${TIMEOUT}
    ${talent page_pending start}    Get Text        //p[text()='Pending Start']/..//h2
    Log To Console        ${dashboard_pending start}
    Log To Console    ${dashboard_pending start}
    Should Be Equal       ${talent page_pending start}      ${dashboard_pending start}

validate talent actions_pending offers
    #    get dashboard value
    Wait Until Page Contains Element    //a[text()='Pending Offers']/../../..//strong    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${dashboard_pending offers}    Get Text    //a[text()='Pending Offers']/../../..//strong
    Wait Until Page Contains Element    //a[text()='Pending Offers']       ${TIMEOUT}
    Click Element        //a[text()='Pending Offers']
#    get talent management value
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //p[text()='Offers']/..//h2        ${TIMEOUT}
    ${talent page_pending offers}    Get Text        //p[text()='Offers']/..//h2
    Log To Console        ${talent page_pending offers}
    Log To Console    ${dashboard_pending offers}
    Should Be Equal       ${talent page_pending offers}      ${dashboard_pending offers}


validate talent actions_Cleared to start
    #    get dashboard value
    Wait Until Page Contains Element    //a[text()='Cleared to Start']/../../..//strong    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${dashboard_cleared to start}    Get Text    //a[text()='Cleared to Start']/../../..//strong
    Wait Until Page Contains Element    //a[text()='Cleared to Start']       ${TIMEOUT}
    Click Element        //a[text()='Cleared to Start']
#    get talent management value
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //p[text()='Cleared to Start']/..//h2        ${TIMEOUT}
    ${talent page_cleared to start}    Get Text        //p[text()='Cleared to Start']/..//h2
    Log To Console        ${talent page_cleared to start}
    Log To Console    ${dashboard_cleared to start}
    Should Be Equal       ${talent page_cleared to start}      ${dashboard_cleared to start}

validate talent actions_Contracts Ending (next 30 days)
    #    get dashboard value
    Wait Until Page Contains Element    //a[text()='Contracts Ending (next 30 days)']/../../..//strong    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${dashboard_Contracts Ending (next 30 days)}    Get Text    //a[text()='Contracts Ending (next 30 days)']/../../..//strong
    Wait Until Page Contains Element    //a[text()='Contracts Ending (next 30 days)']       ${TIMEOUT}
    Click Element        //a[text()='Contracts Ending (next 30 days)']
#    get talent management value
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //p[text()='Contract Ending']/..//h2        ${TIMEOUT}
    ${talent page_Contracts Ending (next 30 days)}    Get Text        //p[text()='Contract Ending']/..//h2
    Log To Console        ${talent page_Contracts Ending (next 30 days)}
    Log To Console    ${dashboard_Contracts Ending (next 30 days)}
    Should Be Equal       ${talent page_Contracts Ending (next 30 days)}      ${dashboard_Contracts Ending (next 30 days)}



validate compliance actions header and below links
    ${expected below links} =    Create List    Expired / Past Due Credentials   Expiring Credentials    Credentials Due this Week
    ${expected header header}=    Set Variable    Compliance Actions
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element   //h2[text()='Compliance Actions']     ${TIMEOUT}
    ${actual header}    Get Text    //h2[text()='Compliance Actions']
    Wait Until Page Contains Element        (//div[@class='col-4 ats-card-col ats-quick-link-col'])[3]//a    ${TIMEOUT}
    ${below links}    Get Webelements    (//div[@class='col-4 ats-card-col ats-quick-link-col'])[3]//a
     ${actual_below_links} =    Create List
    FOR    ${link}    IN    @{below_links}
        ${text} =    Get Text    ${link}
        Append To List    ${actual_below_links}    ${text}
    END

    Should Be Equal      ${expected below links}       ${actual_below_links}
    Should Be Equal      ${expected header header}      ${actual header}
    Log To Console       ${actual_below_links}
    Log To Console       ${actual header}


validate Compliance actions_expired or past due credentials
#    get dashboard value
    Wait Until Page Contains Element    //a[text()='Expired / Past Due Credentials']/../../..//strong    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${dashboard expired or past due cred}    Get Text    //a[text()='Expired / Past Due Credentials']/../../..//strong
    Wait Until Page Contains Element    //a[text()='Expired / Past Due Credentials']        ${TIMEOUT}
    Click Element    //a[text()='Expired / Past Due Credentials']
#    get job orders value
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //p[text()='Expired / Past Due']/..//h2    ${TIMEOUT}
    ${compliance page expired or past due cred}    Get Text        //p[text()='Expired / Past Due']/..//h2
    Log To Console        ${compliance page expired or past due cred}
    Log To Console    ${dashboard expired or past due cred}
    Should Be Equal       ${dashboard expired or past due cred}      ${compliance page expired or past due cred}



validate Compliance actions_Expiring Credentials
#    get dashboard value
    Wait Until Page Contains Element    //a[text()='Expiring Credentials']/../../..//strong    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${dashboard Expiring Credentials}    Get Text    //a[text()='Expiring Credentials']/../../..//strong
    Wait Until Page Contains Element    //a[text()='Expiring Credentials']        ${TIMEOUT}
    Click Element    //a[text()='Expiring Credentials']
#    get job orders value
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //p[text()='Expiring']/..//h2    ${TIMEOUT}
    ${compliance page Expiring cred}    Get Text        //p[text()='Expiring']/..//h2
    Log To Console        ${compliance page Expiring cred}
    Log To Console    ${dashboard Expiring Credentials}
    Should Be Equal       ${dashboard Expiring Credentials}      ${compliance page Expiring cred}


validate Compliance actions_Credentials Due this Week
#    get dashboard value
    Wait Until Page Contains Element    //a[text()='Credentials Due this Week']/../../..//strong    ${TIMEOUT}
    Sleep    ${WAIT_TIME}
    ${dashboard Credentials Due this Week}    Get Text    //a[text()='Credentials Due this Week']/../../..//strong
    Wait Until Page Contains Element    //a[text()='Credentials Due this Week']        ${TIMEOUT}
    Click Element    //a[text()='Credentials Due this Week']
#    get job orders value
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //p[text()='Due this Week']/..//h2    ${TIMEOUT}
    ${compliance page Due this Week}    Get Text        //p[text()='Due this Week']/..//h2
    Log To Console        ${compliance page Due this Week}
    Log To Console    ${dashboard Credentials Due this Week}
    Should Be Equal       ${dashboard Credentials Due this Week}      ${compliance page Due this Week}


open ats talents page
    Wait Until Page Contains Element    //span[@class='icon-workforce nav-icon mb-1']    ${TIMEOUT}
    Click Element    //span[@class='icon-workforce nav-icon mb-1']
    Sleep    ${WAIT_TIME}

filter job offered talents
    Wait Until Page Contains Element    //h2[@class='card-title m-0']/../..//span[@class='icon-indicate icon-folder-check']
    Click Element    //h2[@class='card-title m-0']/../..//span[@class='icon-indicate icon-folder-check']
    Sleep    ${WAIT_TIME}

select talent with status job offered and open
    Wait Until Page Contains Element    (//span[@class='text-decoration-underline'])[1]        ${TIMEOUT}
    Click Element    (//span[@class='text-decoration-underline'])[1]
    Sleep    ${WAIT_TIME}

click on accept offer
    Wait Until Page Contains Element    //span[text()='ACCEPT OFFER']    ${TIMEOUT}
    Click Element    //span[text()='ACCEPT OFFER']
    Sleep    ${WAIT_TIME}

verify whether the offer accept is successful or not
    Wait Until Page Contains Element    //div[@class='d-flex align-items-center flex-wrap mb-2 me-2']//span[text()='Offer Accepted']    ${TIMEOUT}
    Sleep        ${WAIT_TIME}
    ${expected status}=    Set Variable    Offer Accepted
    ${actual status}    Get Text       //div[@class='d-flex align-items-center flex-wrap mb-2 me-2']//span[text()='Offer Accepted']
    Log To Console       ${expected status}
    Log To Console        ${actual status}
    Should Be Equal    ${actual status}        ${expected status}




