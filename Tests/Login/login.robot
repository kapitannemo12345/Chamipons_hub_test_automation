*** Settings ***
Library  SeleniumLibrary
Resource    ../Common/common.robot
Resource    ../Pages_locators/login.robot
Resource    ../Pages_locators/login_cred.robot
Resource    ../Pages_locators/home.robot

*** Test Cases ***
Successful login attempt
    Set selenium implicit wait    5
    Go to home page
    Input login credentials    ${USERNAME}    ${PASSWORD}
    Verify if login was successful
    Finish test case

Failed login attempt
    Set selenium implicit wait    5
    Go to home page
    Input login credentials    ${USERNAME}    ${FAKEPASSWORD}
    Verify if login was unsuccessful
    Finish test case

*** Keywords ***
Input login credentials
    [Arguments]    ${uname}    ${p}
    Click Element    ${login_btn}
    Input Text    name=email    ${uname}
    Input Text    name=password   ${p}
    Click Element    ${login_btn_after_input}
    Sleep    2

Verify if login was successful
    Element Should Be Visible    xpath=//img[@src='${IMAGE_SRC}']

Verify if login was unsuccessful
    Set selenium implicit wait    5
    ${element}=    Get WebElement    xpath=//p[contains(@class, 'text-left') and contains(@class, 'pl-px') and contains(@class, 'text-xs') and contains(@class, 'text-red-700') and contains(@class, 'dark:text-red-500') and text() = 'Błędny e-mail lub hasło']
    Element Should Contain    ${element}    Błędny e-mail lub hasło







