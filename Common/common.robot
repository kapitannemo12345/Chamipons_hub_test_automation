*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Go to home page
    Open browser  about:blank  chrome
    Go to  ${homepage}

Finish test case
    Close browser
