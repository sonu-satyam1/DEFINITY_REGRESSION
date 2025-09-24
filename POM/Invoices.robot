*** Settings ***
Documentation    Definity
Library          SeleniumLibrary
Library          ScreenCapLibrary
Resource         ../Resources/resource.robot
Library          OperatingSystem
Library          String



*** Keywords ***
open the invoices tab
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[@class='icon-brackets nav-svg-icon']    ${TIMEOUT}
    Mouse Over                          //span[@class='icon-brackets nav-svg-icon']
    Click Element                        //a[@href='/invoice']
    Sleep    ${WAIT_TIME}

open ready to invoice
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='READY TO INVOICE']    ${TIMEOUT}
    Mouse Over                          //span[text()='READY TO INVOICE']
    Click Element    //span[text()='READY TO INVOICE']
    Sleep    ${WAIT_TIME}

select invoice from ready to invoice list
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    (//input[@class='mt-1'])[1]    ${TIMEOUT}
    Click Element    (//input[@class='mt-1'])[1]
    Sleep       ${WAIT_TIME}

invoice selected rows from ready to invoice list and generate invoice
    Wait Until Page Contains Element    //span[text()='INVOICE SELECTED ROWS']    ${TIMEOUT}
    Click Element    //span[text()='INVOICE SELECTED ROWS']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='GENERATE INVOICE']    ${TIMEOUT}
    Click Element        //span[text()='GENERATE INVOICE']
    Sleep    ${WAIT_TIME}


open invoices list
    Wait Until Page Contains Element    //span[text()='READY TO INVOICE']    ${TIMEOUT}
    Click Element    //span[text()='READY TO INVOICE']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Invoices']    ${TIMEOUT}
    Click Element    //span[text()='Invoices']
    Sleep    ${WAIT_TIME}

filter submitted invoices
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']    ${TIMEOUT}
    Click Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Submitted']    ${TIMEOUT}
    Click Element    //label[text()='Submitted']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}

select submitted status invoice and approve
    Wait Until Page Contains Element    (//td//a)[1]    ${TIMEOUT}
    Click Element    (//td//a)[1]
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='APPROVE']    ${TIMEOUT}
    Click Element    //span[text()='APPROVE']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Approved']    ${TIMEOUT}
    ${actual_invoice_status}    Get Text    //span[text()='Approved']
    # Compare the manual value with the locator value
    ${expected_invoice_status}    Set Variable    Approved
    IF    '${expected_invoice_status}' == '${actual_invoice_status}'
        Log    "The values match!"
    ELSE
        Log    "The values do NOT match!"
    END
    

filter approved invoices
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']    ${TIMEOUT}
    Click Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Approved']    ${TIMEOUT}
    Click Element    //label[text()='Approved']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}

filter partially submitted invoices
    Wait Until Page Contains Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']    ${TIMEOUT}
    Click Element    //span[text()='Status']/../..//span[@class='k-icon k-i-more-vertical']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //label[text()='Partially Paid']    ${TIMEOUT}
    Click Element    //label[text()='Partially Paid']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Filter']    ${TIMEOUT}
    Click Element    //span[text()='Filter']
    Sleep    ${WAIT_TIME}

select approved or partially submitted invoice
    Wait Until Page Contains Element    (//td//a)[1]    ${TIMEOUT}
    Click Element    (//td//a)[1]
    Sleep    ${WAIT_TIME}

edit approved invoice
    Wait Until Page Contains Element    //button[@aria-label='undefined dropdownbutton']    ${TIMEOUT}
    Click Element    //button[@aria-label='undefined dropdownbutton']
    Sleep    ${WAIT_TIME}

rescind the approved invoice
    Wait Until Page Contains Element    //span[text()='Rescind Approval']    ${TIMEOUT}
    Click Element    //span[text()='Rescind Approval']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //span[text()='Continue']    ${TIMEOUT}
    Click Element    //span[text()='Continue']
    Sleep    5

open Mark Invoice as Paid tab
    Wait Until Page Contains Element    //span[text()='MARK AS PAID']    ${TIMEOUT}
    Click Element    //span[text()='MARK AS PAID']
    Sleep       ${WAIT_TIME}

fill checkNumber and date in Mark Invoice as Paid tab
    Wait Until Page Contains Element    //input[@name='checkNumber']    ${TIMEOUT}
    Input Text    //input[@name='checkNumber']    ${checkNumber}
    Sleep    ${WAIT_TIME}  
    Wait Until Page Contains Element    //button[@aria-label='Choose date']    ${TIMEOUT}
    Click Element    //button[@aria-label='Choose date']
    Sleep    ${WAIT_TIME}
    Wait Until Page Contains Element    //button[@title='Next month']     ${TIMEOUT}
    Click Element    //button[@title='Next month']
    Sleep   ${WAIT_TIME}
    Wait Until Page Contains Element    //button[text()='1']    ${TIMEOUT}
    Click Element    //button[text()='1']
    Sleep   ${WAIT_TIME}


Partial payment of the invoice
    Wait Until Page Contains Element    //input[@class='k-radio k-radio-md']/..//label[text()='Partial Payment']    ${TIMEOUT}
    Click Element    //input[@class='k-radio k-radio-md']/..//label[text()='Partial Payment']
    Sleep    ${WAIT_TIME}
#    Wait Until Location Contains    //input[@name='partialPaymentAmount']/../..//button[@aria-label='Increase value']    ${TIMEOUT}
    Click Element    //input[@name='partialPaymentAmount']/../..//button[@aria-label='Increase value']
    Sleep    ${WAIT_TIME}

submit partial or full payment
    Sleep    ${WAIT_TIME}
#    Wait Until Location Contains    //div[contains(@class,'pr-f')]//span[text()='SUBMIT']    ${TIMEOUT}
    Click Element           //div[contains(@class,'pr-f')]//span[text()='SUBMIT']
    Sleep    ${WAIT_TIME}

capture invoice number for the submitted invoice
    Wait Until Page Contains Element    //h1[@class='post-login-heading my-0 ms-0 me-2']
    ${invoice_details}    Get Text     //h1[@class='post-login-heading my-0 ms-0 me-2']
    Set Suite Variable    ${invoice_details}
    ${parts}=    Split String    ${invoice_details}    #
    ${invoice_number}=   Strip String    ${parts[1]}
    Log    Extracted: ${invoice_number}

capture invoice status for submitted invoice and validate
    ${expected_submitted_invoice_status}    Set Variable    Submitted
    Wait Until Page Contains Element           //span[text()='Submitted']
    ${actual_submitted_invoice_status}    Get Text    //span[text()='Submitted']
    Set Suite Variable                          ${actual_submitted_invoice_status}
    Should Be Equal        ${expected_submitted_invoice_status}    ${actual_submitted_invoice_status}
     
