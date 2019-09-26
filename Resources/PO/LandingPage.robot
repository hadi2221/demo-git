*** Settings ***
Library  Selenium2Library

*** Keywords ***
Load
    Go To  ${START_URL}

Verify Page loaded
    Wait Until Page Contains  Your Amazon.com