*** Settings ***
Library  SeleniumLibrary
Resource    ../Pages_locators/login.robot
Resource    ../Pages_locators/login_cred.robot
Resource    ../Pages_locators/home.robot



*** Test Cases ***
Successful login attempt
    Set selenium implicit wait    5
    Go to home page
    Input login credentials
    Verify if login was successful

*** Keywords ***
Go to home page
    Open browser  about:blank  chrome
    Go to  ${homepage}

Input login credentials
    Click Element    ${login_btn}
    Input Text    name=email    ${USERNAME}
    Input Text    name=password   ${PASSWORD}
    Click Element    ${login_btn_after_input}
    Sleep    2

Verify if login was successful
    Element Should Be Visible    xpath=//img[@src='${IMAGE_SRC}']




