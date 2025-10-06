*** Settings ***
Documentation     Definity
Library           SeleniumLibrary
Library           ScreenCapLibrary
Library           String


*** Variables ***
${url}                 https://testorg-security-qa1.internal-definitywfs.com/signin
${vendor_url}          https://security-qa2.internal-definitywfs.com/signin
${vendor_username}     satyamsonu31@gmail.com
${vendor_pwd}          Test@123
${username}            sonu.satyam@costrategix.com
${password}            Test@123
${TIMEOUT}             30s
${WAIT_TIME}           5
${FILE}                ${CURDIR}${/}resume.jpg
${uploaded_file}       resume.jpg
${checkNumber}         12345
${BROWSER}             Chrome


*** Keywords ***
Wait Until Page Ready
    Wait Until Page Contains Element    xpath=//body        ${TIMEOUT}
    Wait Until Any Loaders Disappear
    Wait Until Network Is Idle
    Wait Until DOM Is Stable

Wait Until Any Loaders Disappear
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'page-loader')]    ${TIMEOUT}
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'loading-overlay')]    ${TIMEOUT}
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'vm-loading-wrapper')]    ${TIMEOUT}
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'modal-backdrop')]    ${TIMEOUT}

Wait Until Network Is Idle
    [Documentation]    Waits until there are no active network requests (XHR/fetch)
    Wait Until Keyword Succeeds    10x    1s
    ...    Execute JavaScript    return window.performance.getEntriesByType('resource').filter(e => e.initiatorType === 'xmlhttprequest' || e.initiatorType === 'fetch').every(e => e.responseEnd > 0);

Wait Until DOM Is Stable
    ${initial}=    Execute JavaScript    return document.getElementsByTagName('*').length;
    Sleep    0.5s
    ${after}=    Execute JavaScript    return document.getElementsByTagName('*').length;
    WHILE    ${initial} != ${after}
        ${initial}=    Set Variable    ${after}
        Sleep    0.5s
        ${after}=    Execute JavaScript    return document.getElementsByTagName('*').length;
    END


open browser with url and login
#    Start Video Recording    alias=None    name=DemoRecording    fps=None    size_percentage=1    embed=True    embed_width=100px    monitor=1
    Create Webdriver       ${BROWSER}
    Go To    ${url}
    Maximize Browser Window
    Wait Until Page Ready
    Input Text        xpath://input[@name='emailAddress']    ${username}
    Wait Until Page Ready
    Input Password    xpath://input[@name='password']        ${password}
    Wait Until Page Ready
    Click Button      xpath://button[@type='submit']
    Wait Until Page Ready
    Wait Until Page Ready


##execute using headless mode
#open browser with url and login
#    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#    Call Method    ${options}    add_argument    --headless
#    Call Method    ${options}    add_argument    --disable-gpu
#    Call Method    ${options}    add_argument    --no-sandbox
#    Create WebDriver    ${BROWSER}    options=${options}
#    ${width}=    Execute Javascript    return window.innerWidth;
#    ${height}=   Execute Javascript    return window.innerHeight;
#    Set Window Size    ${width}    ${height}
#    Go To    ${url}
#    Maximize Browser Window
#    Wait Until Page Ready
#    Input Text        xpath://input[@name='emailAddress']    ${username}
#    Wait Until Page Ready
#    Input Password    xpath://input[@name='password']        ${password}
#    Wait Until Page Ready
#    Click Button      xpath://button[@type='submit']
#    Wait Until Page Ready
#    Wait Until Page Ready

Click Element Via JS
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].click();    ${element}

Hard Refresh Page
    Execute Javascript    location.reload(true)
    Wait Until Page Ready

close browser session
    Close Browser

#    Stop Video Recording    alias=None


